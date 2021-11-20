import 'package:ajk_tour/app_screens/place_detail.dart';
import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget districtCard(context, {image, dynamic text, page, check = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .012),
    ),
    child: Container(
      width: dynamicWidth(context, 1),
      height: dynamicHeight(context, .3),
      color: noColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: dynamicHeight(context, .22),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fitWidth,
              width: dynamicWidth(context, 1),
              placeholder: (context, url) => Image.asset(
                "assets/ajk_logo.png",
                scale: 8,
              ),
            ),
          ),
          SizedBox(
            height: dynamicHeight(context, .08),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dynamicWidth(context, .06),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: myBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: dynamicWidth(context, .06),
                    ),
                    maxLines: 1,
                  ),
                  InkWell(
                    onTap: () {
                      push(
                        context,
                        page,
                      );
                    },
                    child: Container(
                      width: dynamicWidth(context, .26),
                      height: dynamicHeight(context, .05),
                      color: myBlack,
                      child: Center(
                        child: Text(
                          "Explore >>",
                          style: TextStyle(
                            color: myWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicWidth(context, .038),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cityCard(context, {image, dynamic text, page, check = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .012),
    ),
    child: Container(
      width: dynamicWidth(context, .9),
      height: dynamicHeight(context, .3),
      decoration: BoxDecoration(
        color: myWhite,
        boxShadow: [

        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: dynamicHeight(context, .22),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fitWidth,
              width: dynamicWidth(context, 1),
              placeholder: (context, url) => Image.asset(
                "assets/ajk_logo.png",
                scale: 8,
              ),
            ),
          ),
          SizedBox(
            height: dynamicHeight(context, .08),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dynamicWidth(context, .06),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: myBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: dynamicWidth(context, .06),
                    ),
                    maxLines: 1,
                  ),
                  InkWell(
                    onTap: () {
                      push(
                        context,
                        page,
                      );
                    },
                    child: Container(
                      width: dynamicWidth(context, .26),
                      height: dynamicHeight(context, .05),
                      color: myBlack,
                      child: Center(
                        child: Text(
                          "Explore >>",
                          style: TextStyle(
                            color: myWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicWidth(context, .038),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget stateDetailCard(
    context, image, placeName, city, latitude, longitude, description) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .012),
    ),
    child: InkWell(
      onTap: () {
        push(
          context,
          PlaceDetail(
            name: placeName,
            image: image,
            city: city,
            latitude: latitude,
            longitude: longitude,
            description: description,
          ),
        );
      },
      child: Center(
        child: Container(
          width: dynamicWidth(context, .9),
          height: dynamicHeight(context, .26),
          decoration: BoxDecoration(
            color: myWhite,
            borderRadius: BorderRadius.circular(
              dynamicHeight(context, .012),
            ),
            boxShadow: [
              BoxShadow(
                color: myBlack.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    dynamicHeight(context, .012),
                  ),
                  topLeft: Radius.circular(
                    dynamicHeight(context, .012),
                  ),
                ),
                child: Image.network(
                  image,
                  height: dynamicHeight(context, .18),
                  width: dynamicWidth(context, 1),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Flexible(
                child: Center(
                  child: SizedBox(
                    width: dynamicWidth(context, .8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          placeName,
                          style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicWidth(context, .056),
                          ),
                          maxLines: 1,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: myBlack.withOpacity(.5),
                                  size: dynamicWidth(context, .044),
                                ),
                              ),
                              TextSpan(
                                text: " $city",
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
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget toDoCards(context, bgColor, icon, text) {
  return Container(
    width: dynamicWidth(context, .4),
    height: dynamicHeight(context, .136),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(
        dynamicWidth(context, .03),
      ),
    ),
    padding: EdgeInsets.all(
      dynamicWidth(context, .03),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: dynamicHeight(context, .024),
              backgroundColor: myWhite,
              child: Icon(
                icon,
                color: myBlack,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: myWhite,
                  fontSize: dynamicWidth(context, .042),
                ),
                maxLines: 2,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
