import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchText = TextEditingController();

  dynamic searchResult;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myGrey,
        floatingActionButton: sosFloatingButton(context),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                width: dynamicWidth(context, 0.94),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: dynamicHeight(context, .02),
                      ),
                      child: Hero(
                        tag: "SearchBar",
                        child: Material(
                          color: noColor,
                          child: searchbar(
                            context,
                            controller: searchText,
                            submitFunction: (value) {
                              setState(() {
                                searchResult =
                                    ApiData().getInfo("search/$value");
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            searchText.text.toString() == ""
                ? Container()
                : Flexible(
                    child: SizedBox(
                      width: dynamicWidth(context, 1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: dynamicHeight(context, .024),
                        ),
                        child: FutureBuilder(
                          future: searchResult,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.length.toString() == "0") {
                                return Center(
                                  child: Text(
                                    "Nothing To Show!!\nSearch Something Else!!",
                                    style: TextStyle(
                                      fontSize: dynamicWidth(context, .06),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, i) {
                                    return placeCard(
                                      context,
                                      image:
                                          snapshot.data[i]["image"].toString(),
                                      placeName:
                                          snapshot.data[i]["name"].toString(),
                                      city: snapshot.data[i]["city_name"]
                                          .toString(),
                                      latitude: snapshot.data[i]["latitude"]
                                          .toString(),
                                      longitude: snapshot.data[i]["longitude"]
                                          .toString(),
                                      description: snapshot.data[i]
                                              ["description"]
                                          .toString(),
                                    );
                                  },
                                );
                              }
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
