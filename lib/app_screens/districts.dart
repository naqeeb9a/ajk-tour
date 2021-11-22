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
      appBar: customBar("DISTRICTS", bgColor: myGrey),
      floatingActionButton: sosFloatingButton(context),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: dynamicHeight(context, .06),
        ),
        child: SizedBox(
          width: dynamicWidth(context, 1),
          child: FutureBuilder(
            future: ApiData().getInfo("districts"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return districtCard(
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
    );
  }
}
