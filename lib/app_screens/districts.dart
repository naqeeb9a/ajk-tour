import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/app_screens/cities.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class Districts extends StatefulWidget {
  const Districts({Key? key}) : super(key: key);

  @override
  _DistrictsState createState() => _DistrictsState();
}

class _DistrictsState extends State<Districts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myGrey,
        floatingActionButton: sosFloatingButton(),
        body: Column(
          children: [
            imageHeader(
              context,
              "assets/districts.jpg",
              "DISTRICTS",
              false,
              height: dynamicHeight(context, .28),
              assetImage: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: dynamicHeight(context, .02),
              ),
              child: SizedBox(
                width: dynamicWidth(context, 1),
                height: dynamicHeight(context, .58),
                child: FutureBuilder(
                  future: ApiData().getInfo("districts"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return stateCard(
                            context,
                            image: snapshot.data[i]["image"].toString(),
                            text: snapshot.data[i]["name"].toString(),
                            page: Cities(
                              cityName: snapshot.data[i]["name"].toString(),
                              image: snapshot.data[i]["image"].toString(),
                              index: snapshot.data[i]["id"],
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
