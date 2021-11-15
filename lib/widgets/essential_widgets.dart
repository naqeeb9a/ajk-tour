import 'package:ajk_tour/utils/config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'dynamic_sizes.dart';

customBar(text, {color = ""}) {
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
    backgroundColor: Colors.transparent,
    elevation: 0,
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
    child: Image.asset(
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
