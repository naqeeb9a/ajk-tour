import 'dart:ui';

import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedDetailPage extends StatelessWidget {
  final _pageController = PageController();
  SelectedDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              tabImages1.length,
              (int index) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(tabImages1[index]),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 57.6,
              margin: const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 57.6,
                      width: 57.6,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: const Color(0x10000000),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
              width: dynamicWidth(context, 1),
              padding: const EdgeInsets.only(
                  left: 28.8, bottom: 48, right: 28.8, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: tabImages1.length,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFFFFFFFF),
                        dotColor: Color(0xFFababab),
                        dotHeight: 4.8,
                        dotWidth: 6,
                        spacing: 4.8),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 19.2),
                    child: Text(
                      "recommendedModel tagLine",
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 19.2),
                    child: Text(
                      "recommendedModel description",
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          FittedBox(
                            child: Text(
                              'Start from',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 62.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 28.8, right: 28.8),
                            child: const FittedBox(
                              child: Text(
                                'Explore Now >>',
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
