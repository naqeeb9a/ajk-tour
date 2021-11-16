import 'package:ajk_tour/app_screens/search_screen.dart';
import 'package:ajk_tour/app_screens/selected_detail_page.dart';
import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: dynamicHeight(context, .01),
                  horizontal: dynamicWidth(context, .06),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/ajk_logo.png",
                      height: dynamicHeight(context, .08),
                    ),
                    SizedBox(
                      width: dynamicWidth(context, .06),
                    ),
                    Text(
                      "Welcome to\nAzad Jammu Kashmir",
                      style: TextStyle(
                          fontSize: dynamicWidth(context, .054),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dynamicHeight(context, .03),
                vertical: dynamicHeight(context, .03),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore\nthe Nature",
                    style: TextStyle(
                        fontSize: dynamicWidth(context, .1),
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      push(
                        context,
                        const SearchScreen(),
                      );
                    },
                    child: Hero(
                      tag: "SearchBar",
                      child: upperIcons(context, Icons.search),
                    ),
                  )
                ],
              ),
            ),
            tabsListing(context),
            SizedBox(
              height: dynamicHeight(context, 0.01),
            ),
            upperCards(context, _pageController),
            smoothIndicatorCustomView(context, tabImages, _pageController),
            rowText(context),
            lowerCards(context, tabImages1),
          ],
        ),
      ),
    );
  }
}

tabsListing(
  context,
) {
  return Container(
    height: dynamicHeight(context, .04),
    margin: EdgeInsets.only(
      left: dynamicWidth(context, .04),
    ),
    child: DefaultTabController(
      length: 4,
      child: TabBar(
        labelPadding: EdgeInsets.symmetric(
          horizontal: dynamicWidth(context, .03),
        ),
        indicatorPadding: EdgeInsets.symmetric(
          horizontal: dynamicWidth(context, .03),
        ),
        isScrollable: true,
        labelColor: myBlack,
        unselectedLabelColor: myBlack.withOpacity(.5),
        indicatorColor: myBlack,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Tab(
            child: Text('Recommended'),
          ),
          Tab(
            child: Text('Popular'),
          ),
          Tab(
            child: Text('New Destination'),
          ),
          Tab(
            child: Text('Hidden Gems'),
          )
        ],
      ),
    ),
  );
}

smoothIndicatorCustomView(context, tabsArray, _pageController) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .014),
      horizontal: dynamicWidth(context, .08),
    ),
    child: SmoothPageIndicator(
      controller: _pageController,
      count: tabsArray.length,
      effect: ExpandingDotsEffect(
        activeDotColor: myBlack,
        dotColor: myBlack.withOpacity(.4),
        dotHeight: dynamicHeight(context, .008),
        dotWidth: dynamicWidth(context, .02),
        spacing: dynamicWidth(context, .016),
      ),
    ),
  );
}

rowText(context) {
  return Padding(
    padding: EdgeInsets.only(
      top: dynamicHeight(context, .04),
      left: dynamicWidth(context, .06),
      right: dynamicWidth(context, .06),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Popular Places',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: dynamicWidth(context, .05),
          ),
        ),
        const Text(
          'Show All',
        ),
      ],
    ),
  );
}

upperCards(context, _pageController) {
  return Container(
    height: dynamicHeight(context, 0.2),
    margin: EdgeInsets.only(
      top: dynamicHeight(context, .01),
    ),
    child: PageView(
      physics: const BouncingScrollPhysics(),
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        tabImages.length,
        (int index) => GestureDetector(
          onTap: () {
            push(
              context,
              SelectedDetailPage(),
            );
          },
          child: Container(
            margin: EdgeInsets.only(
              right: dynamicWidth(context, .04),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                dynamicWidth(context, .024),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  tabImages[index],
                  scale: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

lowerCards(context, tabImages) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .026),
    ),
    height: dynamicHeight(context, .16),
    child: ListView.builder(
      itemCount: tabImages.length,
      padding: EdgeInsets.symmetric(
        horizontal: dynamicWidth(context, .06),
      ),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: dynamicHeight(context, .16),
          width: dynamicWidth(context, .54),
          margin: EdgeInsets.only(
            right: dynamicWidth(context, .04),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              dynamicWidth(context, .03),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(tabImages[index]),
            ),
          ),
        );
      },
    ),
  );
}

upperIcons(context, icons) {
  return Container(
    height: dynamicHeight(context, .054),
    width: dynamicHeight(context, .054),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        dynamicWidth(context, .02),
      ),
      color: myWhite,
    ),
    child: Center(
      child: Icon(
        icons,
      ),
    ),
  );
}

imagesSlider(context, List array) {
  return CarouselSlider(
    options: CarouselOptions(
      height: dynamicHeight(context, 0.2),
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
    items: array.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(
              dynamicWidth(context, .03),
            ),
            child: CachedNetworkImage(
              imageUrl: i.toString(),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }).toList(),
  );
}
