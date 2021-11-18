import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/app_screens/cities.dart';
import 'package:ajk_tour/utils/app_routes.dart';
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
  int selectedItem = 0, itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      body: Stack(
        children: [
          FutureBuilder(
            future: ApiData().getInfo("districts"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GestureDetector(
                  onTap: () {
                    push(
                      context,
                      Cities(
                        cityName:
                            snapshot.data[selectedItem]["name"].toString(),
                        image: snapshot.data[selectedItem]["image"].toString(),
                        index: itemIndex,
                      ),
                    );
                  },
                  child: ListWheelScrollView(
                    diameterRatio: 5,
                    itemExtent: dynamicHeight(context, .25),
                    physics: const BouncingScrollPhysics(),
                    onSelectedItemChanged: (i) {
                      setState(() {
                        selectedItem = i;
                        itemIndex = snapshot.data[i]["id"];
                      });
                    },
                    children: List.generate(
                      snapshot.data!.length,
                      (i) => stateCard(
                        context,
                        image: snapshot.data[i]["image"],
                        text: snapshot.data[i]["name"],
                      ),
                    ).toList(),
                  ),
                );
              } else {
                return ListWheelScrollView(
                  diameterRatio: 5,
                  itemExtent: dynamicHeight(context, .25),
                  physics: const NeverScrollableScrollPhysics(),
                  onSelectedItemChanged: (i) {
                    selectedItem = i;
                  },
                  children: List.generate(
                    3,
                    (i) => stateCard(context, check: true),
                  ).toList(),
                );
              }
            },
          ),
          imageHeader(
            context,
            "assets/districts.jpg",
            "DISTRICTS",
            false,
            height: dynamicHeight(context, .28),
            assetImage: true,
          ),
        ],
      ),
    );
  }
}
