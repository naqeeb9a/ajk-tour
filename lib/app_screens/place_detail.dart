import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({Key? key}) : super(key: key);

  @override
  _PlaceDetailState createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: dynamicWidth(context, 1),
                    height: dynamicHeight(context, .4),
                    child: homeSlider(
                      context,
                      dynamicHeight(context, .4),
                      3,
                      1.0,
                      "assets/1.jpg",
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: dynamicHeight(context, .01),
                    horizontal: dynamicWidth(context, .04),
                  ),
                  child: InkWell(
                    onTap: () {
                      pop(context);
                    },
                    child: CircleAvatar(
                      radius: dynamicHeight(context, .03),
                      backgroundColor: myBlack,
                      child: const Icon(
                        Icons.arrow_back,
                        color: myWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
