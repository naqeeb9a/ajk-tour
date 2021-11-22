import 'package:ajk_tour/utils/config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'dynamic_sizes.dart';

customBar(text, {color = "", elevation = "", bgColor = ""}) {
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(
          color: myBlack, fontWeight: FontWeight.bold, fontSize: 30),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: color == "" ? myBlack : color,
    ),
    backgroundColor: bgColor == "" ? Colors.transparent : bgColor,
    elevation: elevation == "" ? 0 : elevation,
  );
}

Widget homeSlider(
  context,
  height,
  length,
  viewFraction,
  image,
) {
  return CarouselSlider.builder(
    itemCount: length,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        sliderContainer(context, image),
    options: CarouselOptions(
      enableInfiniteScroll: false,
      height: height,
      enlargeCenterPage: false,
      viewportFraction: viewFraction,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 6),
      autoPlayAnimationDuration: const Duration(seconds: 2),
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
    ),
  );
}

Widget sliderContainer(context, String image) {
  return SizedBox(
    width: dynamicWidth(context, 1),
    child: Image.network(
      image,
      fit: BoxFit.fitHeight,
      // placeholder: (context, string) {
      //   return Image.asset(
      //     "assets/loader.gif",
      //     scale: 6,
      //   );
      // },
    ),
  );
}

Widget imageHeader(context, image, text, appBar, {height = "", assetImage}) {
  return SizedBox(
    width: dynamicWidth(context, 1),
    height: height == "" ? dynamicHeight(context, .24) : height,
    child: Stack(
      children: [
        SizedBox(
          width: dynamicWidth(context, 1),
          height: height == "" ? dynamicHeight(context, .24) : height,
          child: assetImage == false
              ? Image.network(
                  image,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
        ),
        Container(
          width: dynamicWidth(context, 1),
          height: height == "" ? dynamicHeight(context, .24) : height,
          color: myBlack.withOpacity(.5),
        ),
        SizedBox(
          width: dynamicWidth(context, 1),
          height: height == "" ? dynamicHeight(context, .24) : height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appBar == true ? customBar("", color: myWhite) : const SizedBox(),
              Padding(
                padding: EdgeInsets.only(
                  bottom: dynamicHeight(context, .02),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: myWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: dynamicWidth(context, .08),
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget sosFloatingButton(context) {
  return FloatingActionButton.extended(
    label: const Text("SOS"),
    onPressed: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return customDialog(context);
          });
    },
    backgroundColor: Colors.red,
    isExtended: true,
    icon: const Icon(
      Icons.add_alert,
    ),
  );
}

dynamic customDialog(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: dynamicHeight(context, .4),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              dynamicWidth(context, .1),
              dynamicHeight(context, .12),
              dynamicWidth(context, .1),
              dynamicHeight(context, .01),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Success !!!',
                  style: TextStyle(
                    color: primaryGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: dynamicWidth(context, .06),
                  ),
                ),
                Text(
                  "AJK Police received your SOS Request."
                  "\nWe received your Name, Mobile Number and Location."
                  "\nSoon we'll be there!",
                  style: TextStyle(
                    fontSize: dynamicWidth(context, .046),
                  ),
                  textAlign: TextAlign.justify,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: primaryGreen,
                  child: const Text(
                    'Got It',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -dynamicHeight(context, .07),
          child: Image.asset(
            "assets/ajk_police.png",
            fit: BoxFit.cover,
            width: dynamicWidth(context, .3),
          ),
        ),
      ],
    ),
  );
}
