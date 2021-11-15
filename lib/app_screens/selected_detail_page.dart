import 'package:ajk_tour/utils/app_routes.dart';
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
                    color: myBlack,
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
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.56),
              ),
              width: dynamicWidth(context, 1),
              padding: EdgeInsets.symmetric(
                vertical: dynamicHeight(context, .04),
                horizontal: dynamicWidth(context, .06),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: tabImages1.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: myWhite,
                      dotColor: myWhite.withOpacity(.6),
                      dotHeight: dynamicHeight(context, .01),
                      dotWidth: dynamicWidth(context, .02),
                      spacing: dynamicWidth(context, .014),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: dynamicHeight(context, .02),
                    ),
                    child: const Text(
                      "recommendedModel tagLine",
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: myWhite,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: dynamicHeight(context, .02),
                    ),
                    child: const Text(
                      "recommendedModel description",
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: myWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: dynamicHeight(context, .05),
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
                              style: TextStyle(
                                color: myWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: dynamicWidth(context, .34),
                        height: dynamicHeight(context, .06),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            dynamicWidth(context, .02),
                          ),
                          color: myWhite,
                        ),
                        child: const Center(
                          child: Text(
                            'Explore Now >>',
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
