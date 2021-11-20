import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

import 'city_details.dart';

class Cities extends StatefulWidget {
  final String cityName, image;
  final int index;

  const Cities(
      {Key? key,
      required this.cityName,
      required this.image,
      required this.index})
      : super(key: key);

  @override
  _CitiesState createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  dynamic top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(),
      appBar: customBar(widget.cityName, bgColor: myGrey),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: dynamicHeight(context, .02),
        ),
        child: FutureBuilder(
          future: ApiData().getInfo("cities/" + widget.index.toString()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Hero(
                    tag: i,
                    child: Material(
                      color: noColor,
                      child: cityCard(
                        context,
                        image: snapshot.data[i]["image"].toString(),
                        text: snapshot.data[i]["name"].toString(),
                        page: CityDetail(
                          stateName: snapshot.data[i]["name"].toString(),
                          image: snapshot.data[i]["image"].toString(),
                          index: snapshot.data[i]["id"],
                          i: i,
                        ),
                      ),
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
    );
  }
}
