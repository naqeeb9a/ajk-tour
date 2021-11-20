import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatefulWidget {
  final String name, city, latitude, longitude, description, image;

  const PlaceDetail({
    Key? key,
    required this.image,
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.description,
  }) : super(key: key);

  @override
  _PlaceDetailState createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(),
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  width: dynamicWidth(context, 1),
                  height: dynamicHeight(context, .5),
                  child: Center(
                    child: Container(
                      width: dynamicWidth(context, .92),
                      height: dynamicHeight(context, .46),
                      decoration: BoxDecoration(
                        color: myWhite,
                        borderRadius: BorderRadius.circular(
                          dynamicWidth(context, .12),
                        ),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            widget.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: dynamicHeight(context, .02),
                                  horizontal: dynamicWidth(context, .06),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    pop(context);
                                  },
                                  child: Container(
                                    width: dynamicWidth(context, .1),
                                    height: dynamicWidth(context, .1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        dynamicWidth(context, .02),
                                      ),
                                      color: myWhite,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: myBlack,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: dynamicWidth(context, .12),
                  child: CircleAvatar(
                    radius: dynamicWidth(context, .046),
                    backgroundColor: myWhite,
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: myBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SizedBox(
              width: dynamicWidth(context, .9),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: dynamicHeight(context, .01),
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
                                  text: " " + widget.city,
                                  style: TextStyle(
                                    color: myBlack.withOpacity(.5),
                                    fontWeight: FontWeight.normal,
                                    fontSize: dynamicWidth(context, .046),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
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
                              widget.description,
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
                    SizedBox(
                      height: dynamicHeight(context, .08),
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
