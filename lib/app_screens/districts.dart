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
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      body: Stack(
        children: [
          FutureBuilder(
            future: ApiData().getDistrictList(),
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
                      ),
                    );
                  },
                  child: ListWheelScrollView(
                    diameterRatio: 5,
                    itemExtent: dynamicHeight(context, .25),
                    physics: const BouncingScrollPhysics(),
                    onSelectedItemChanged: (i) {
                      selectedItem = i;
                    },
                    children: List.generate(
                      snapshot.data!.length,
                      (i) => stateCard(
                        context,
                        snapshot.data[i]["image"],
                        snapshot.data[i]["name"],
                      ),
                    ).toList(),
                  ),
                );
              }
              return const LinearProgressIndicator(
                color: myBlack,
              );
            },
          ),
          ColoredBox(
            color: primaryGreen,
            child: imageHeader(
              context,
              "https://www.visitswatvalley.com/images/naran-kaghan.jpg",
              "DISTRICTS",
              false,
              height: dynamicHeight(context, .28),
            ),
          ),
        ],
      ),
    );
  }
}
