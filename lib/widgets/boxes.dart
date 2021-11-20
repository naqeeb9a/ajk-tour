import 'package:ajk_tour/app_screens/place_detail.dart';
import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget districtCard(context, {image, dynamic text, page, check = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .002),
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
                      width: dynamicWidth(context, .24),
                      height: dynamicHeight(context, .046),
                      color: myBlack,
                      child: Center(
                        child: Text(
                          "Explore >>",
                          style: TextStyle(
                            color: myWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicWidth(context, .036),
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
      vertical: dynamicHeight(context, .014),
      horizontal: dynamicWidth(context, .05),
    ),
    child: Container(
      width: dynamicWidth(context, .9),
      height: dynamicHeight(context, .24),
      decoration: BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.circular(
          dynamicHeight(context, .015),
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            image,
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: myBlack.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        color: noColor,
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              child: Container(
                width: dynamicWidth(context, .9),
                height: dynamicHeight(context, .08),
                decoration: BoxDecoration(
                  color: myBlack.withOpacity(.6),
                  borderRadius: BorderRadius.circular(
                    dynamicHeight(context, .015),
                  ),
                ),
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
                          color: myWhite,
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
                          decoration: BoxDecoration(
                            color: myGrey,
                            borderRadius: BorderRadius.circular(
                              dynamicHeight(context, .01),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Explore >>",
                              style: TextStyle(
                                color: myBlack,
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
            ),
          ],
        ),
      ),
    ),
  );
}

Widget placeCard(context,
    {image = "",
    placeName = "",
    city = "",
    latitude = "",
    longitude = "",
    description = "",
    shimmerCheck = false}) {
  return (shimmerCheck == true)
      ? Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey[300]!,
          child: Container(
            margin: EdgeInsets.all(dynamicHeight(context, 0.02)),
            padding: EdgeInsets.all(dynamicHeight(context, 0.016)),
            width: dynamicWidth(context, .9),
            height: dynamicHeight(context, .2),
            decoration: BoxDecoration(
              color: myWhite,
              borderRadius: BorderRadius.circular(
                dynamicHeight(context, .02),
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
          ),
        )
      : InkWell(
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
          child: Container(
            margin: EdgeInsets.all(dynamicHeight(context, 0.02)),
            padding: EdgeInsets.all(dynamicHeight(context, 0.016)),
            width: dynamicWidth(context, .9),
            height: dynamicHeight(context, .2),
            decoration: BoxDecoration(
              color: myWhite,
              borderRadius: BorderRadius.circular(
                dynamicHeight(context, .02),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(dynamicHeight(context, .012)),
                  child: Image.network(
                    image,
                    height: dynamicHeight(context, .18),
                    width: dynamicWidth(context, 0.3),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  width: dynamicWidth(context, 0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Row(
                        children: const [
                          Text("4.7"),
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: myGrey,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(
                        description.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.bookmark),
                    Icon(Icons.arrow_forward)
                  ],
                )
              ],
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
