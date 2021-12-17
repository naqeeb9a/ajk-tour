import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

import 'city_details.dart';

class PopularCities extends StatefulWidget {
  const PopularCities({Key? key}) : super(key: key);

  @override
  _PopularCitiesState createState() => _PopularCitiesState();
}

class _PopularCitiesState extends State<PopularCities> {
  dynamic top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(context),
      appBar: customBar(context, "Popular Cities", bgColor: myGrey),
      body: FutureBuilder(
        future: ApiData().getInfo("popularCities"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return cityCard(
                  context,
                  image: snapshot.data[i]["image"].toString(),
                  text: snapshot.data[i]["name"].toString(),
                  page: CityDetail(
                    stateName: snapshot.data[i]["name"].toString(),
                    image: snapshot.data[i]["image"].toString(),
                    index: snapshot.data[i]["id"],
                    i: i,
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
    );
  }
}
