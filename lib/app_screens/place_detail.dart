import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
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
                    child: Container(
                      width: dynamicWidth(context, .14),
                      height: dynamicHeight(context, .06),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          dynamicWidth(context, .02),
                        ),
                        color: myBlack.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: myWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: SizedBox(
              width: dynamicWidth(context, .9),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: dynamicHeight(context, .02),
                        bottom: dynamicHeight(context, .01),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: myBlack.withOpacity(.5),
                                    size: dynamicWidth(context, .05),
                                  ),
                                ),
                                TextSpan(
                                  text: " Mirpur",
                                  style: TextStyle(
                                    color: myBlack.withOpacity(.5),
                                    fontWeight: FontWeight.normal,
                                    fontSize: dynamicWidth(context, .046),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.favorite_border_rounded,
                            color: myBlack,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Abcdef ghijkl",
                          style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicWidth(context, .064),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: dynamicHeight(context, .01),
                        bottom: dynamicHeight(context, .01),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.favorite,
                                    color: myBlack.withOpacity(.5),
                                    size: dynamicWidth(context, .048),
                                  ),
                                ),
                                TextSpan(
                                  text: " 1400 People like this",
                                  style: TextStyle(
                                    color: myBlack.withOpacity(.5),
                                    fontWeight: FontWeight.normal,
                                    fontSize: dynamicWidth(context, .044),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: dynamicWidth(context, .04),
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.recommend,
                                    color: myBlack.withOpacity(.5),
                                    size: dynamicWidth(context, .048),
                                  ),
                                ),
                                TextSpan(
                                  text: " 100",
                                  style: TextStyle(
                                    color: myBlack.withOpacity(.5),
                                    fontWeight: FontWeight.normal,
                                    fontSize: dynamicWidth(context, .044),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: dynamicHeight(context, .03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "sshdfdfdfdsjf hjhjd hfjjfhs djf jdsh djhdjhj dfdshf dshfdshjf dfhdhf fhdsjhfds djfhjdshf hfjds "
                              "sshdfdfdfdsjf hjhjd hfjjfhs djf jdsh djhdjhj dfdshf dshfdshjf dfhdhf fhdsjhfds djfhjdshf hfjds "
                              "sshdfdfdfdsjf hjhjd hfjjfhs djf jdsh djhdjhj dfdshf dshfdshjf dfhdhf fhdsjhfds djfhjdshf hfjds "
                              "sshdfdfdfdsjf hjhjd hfjjfhs djf jdsh djhdjhj dfdshf dshfdshjf dfhdhf fhdsjhfds djfhjdshf hfjds "
                              "sshdfdfdfdsjf hjhjd hfjjfhs djf jdsh djhdjhj dfdshf dshfdshjf dfhdhf fhdsjhfds",
                              style: TextStyle(
                                fontSize: dynamicWidth(context, .046),
                                color: myBlack,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "To Do",
                          style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicWidth(context, .064),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: dynamicHeight(context, .02),
                      ),
                      child: Wrap(
                        spacing: dynamicWidth(context, .032),
                        runSpacing: dynamicHeight(context, .014),
                        children: [
                          toDoCards(
                            context,
                            primaryBlue,
                            Icons.alt_route_rounded,
                            "Travel Guide",
                          ),
                          toDoCards(
                            context,
                            primaryGreen,
                            Icons.hotel_rounded,
                            "Nearby Hotels",
                          ),
                          toDoCards(
                            context,
                            primaryOrange,
                            Icons.restaurant_menu_rounded,
                            "Nearby Restaurants",
                          ),
                          toDoCards(
                            context,
                            primaryPurple,
                            Icons.reviews_rounded,
                            "User Reviews",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
