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

Widget sosFloatingButton() {
  return const FloatingActionButton.extended(
    label: Text("SOS"),
    onPressed: null,
    backgroundColor: Colors.red,
    isExtended: true,
    icon: Icon(
      Icons.add_alert,
    ),
  );
}
