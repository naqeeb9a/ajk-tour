import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ajk_tour/utils/config.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Explore\nthe Nature",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    upperIcons(Icons.search),
                  ],
                ),
              ),
              SizedBox(
                height: dynamicHeight(context, 0.01),
              ),
              tabsListing(),
              SizedBox(
                height: dynamicHeight(context, 0.03),
              ),
              upperCards(context, _pageController),
              smoothIndicatorCustomView(tabImages, _pageController),
              rowText(),
              lowerCards(tabImages1),
            ],
          ),
        ),
      ),
    );
  }
}

tabsListing() {
  return Container(
    height: 30,
    margin: const EdgeInsets.only(left: 14.4, top: 28.8),
    child: const DefaultTabController(
      length: 4,
      child: TabBar(
          labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
          indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
          isScrollable: true,
          labelColor: Color(0xFF000000),
          unselectedLabelColor: Color(0xFF8a8a8a),
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
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
          ]),
    ),
  );
}

smoothIndicatorCustomView(tabsArray, _pageController) {
  return Padding(
    padding: const EdgeInsets.only(left: 28.8, top: 28.8),
    child: SmoothPageIndicator(
      controller: _pageController,
      count: tabsArray.length,
      effect: const ExpandingDotsEffect(
          activeDotColor: Color(0xFF8a8a8a),
          dotColor: Color(0xFFababab),
          dotHeight: 4.8,
          dotWidth: 6,
          spacing: 4.8),
    ),
  );
}

rowText() {
  return Padding(
    padding: const EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Popular Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          'Show All ',
        ),
      ],
    ),
  );
}

upperCards(context, _pageController) {
  return Container(
    height: dynamicHeight(context, 0.25),
    margin: const EdgeInsets.only(top: 16),
    child: PageView(
      physics: const BouncingScrollPhysics(),
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        tabImages.length,
        (int index) => GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 28.8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.6),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(tabImages[index], scale: 1),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

lowerCards(tabImages) {
  return Container(
    margin: const EdgeInsets.only(top: 28.8, bottom: 16.8),
    height: 124.8,
    child: ListView.builder(
      itemCount: tabImages.length,
      padding: const EdgeInsets.only(left: 28.8, right: 12),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 124.8,
          width: 188.4,
          margin: const EdgeInsets.only(right: 16.8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.6),
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

upperIcons(icons) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 50,
      width: 50,
      child: Icon(icons));
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
            borderRadius: BorderRadius.circular(15),
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
