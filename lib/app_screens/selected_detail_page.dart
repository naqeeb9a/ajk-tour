import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedDetailPage extends StatelessWidget {
  final String previousImage;
  final String previousDescription;
  final String previousText;
  final _pageController = PageController();

  SelectedDetailPage({
    Key? key,
    required this.previousImage,
    required this.previousDescription, required this.previousText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(context),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              1,
              (int index) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: CachedNetworkImageProvider(previousImage),
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
                    count: 1,
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
                    child:  Text(
                      previousText.toString(),
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
                    child:  Text(
                      previousDescription.toString(),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
