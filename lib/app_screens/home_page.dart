import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/app_screens/popular_cities.dart';
import 'package:ajk_tour/app_screens/search_screen.dart';
import 'package:ajk_tour/app_screens/selected_detail_page.dart';
import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'city_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController(viewportFraction: 0.8);
  late TabController _tabController;
  List<Widget> tabsArray=[
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
          ),
        ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabsArray.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(context),
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
            tabsListing(context, _tabController,tabsArray),
            SizedBox(
              height: dynamicHeight(context, 0.01),
            ),
            Container(
              height: dynamicHeight(context, 0.2),
              child: TabBarView(
                controller: _tabController,
                children: [upperCards(context, _pageController,"popularPlaces"),upperCards(context, _pageController,"recommendedPlaces"),upperCards(context, _pageController,"hiddenGems"),upperCards(context, _pageController,"newDestinations"),]),
            ),
            smoothIndicatorCustomView(context, _pageController),
            rowText(context),
            lowerCards(context, tabImages1),
          ],
        ),
      ),
    );
  }
}

tabsListing(context, controller,tabarray) {
  return Container(
    height: dynamicHeight(context, .04),
    margin: EdgeInsets.only(
      left: dynamicWidth(context, .04),
    ),
    child: DefaultTabController(
      length: tabarray.length,
      child: TabBar(
        controller: controller,
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
        tabs: tabarray
      ),
    ),
  );
}

smoothIndicatorCustomView(context, _pageController) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .014),
      horizontal: dynamicWidth(context, .08),
    ),
    child: FutureBuilder(
        future: ApiData().getInfo("recommendedPlaces"),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SmoothPageIndicator(
              controller: _pageController,
              count: snapshot.data.length,
              effect: ExpandingDotsEffect(
                activeDotColor: myBlack,
                dotColor: myBlack.withOpacity(.4),
                dotHeight: dynamicHeight(context, .008),
                dotWidth: dynamicWidth(context, .02),
                spacing: dynamicWidth(context, .016),
              ),
            );
          } else {
            return Container();
          }
        }),
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
          'Popular Cities',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: dynamicWidth(context, .05),
          ),
        ),
        InkWell(
          onTap: () {
            push(
              context,
              PopularCities(),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: dynamicHeight(context, .01),
            ),
            child: Text(
              'Show All',
              style: TextStyle(
                fontSize: dynamicWidth(context, .038),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

upperCards(context, _pageController,apiText) {
  return FutureBuilder(
      future: ApiData().getInfo(apiText),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                snapshot.data.length,
                (int index) => GestureDetector(
                  onTap: () {
                    push(
                      context,
                      SelectedDetailPage(
                        previousImage: snapshot.data[index]["image"],
                        previousDescription: snapshot.data[index]
                            ["description"],
                        previousText: snapshot.data[index]["name"],
                      ),
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
                          snapshot.data[index]["image"],
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
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
                4,
                (int index) => Shimmer.fromColors(
                  baseColor:Colors.grey,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: dynamicWidth(context, .04),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(
                        dynamicWidth(context, .024),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      });
}

lowerCards(context, tabImages) {
  return Container(
    height: dynamicHeight(context, .24),
    padding: EdgeInsets.only(
      left: dynamicWidth(context, .04),
    ),
    child: FutureBuilder(
      future: ApiData().getInfo("popularCities"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length > 3 ? 3 : snapshot.data.length,
            itemBuilder: (context, i) {
              return cityCard(
                context,
                image: snapshot.data[i]["image"].toString(),
                text: snapshot.data[i]["name"].toString(),
                width: dynamicWidth(context, .8),
                homeCard: true,
                page: CityDetail(
                  stateName: snapshot.data[i]["name"].toString(),
                  image: snapshot.data[i]["image"].toString(),
                  index: snapshot.data[i]["id"],
                  i: i,
                ),
              );
            },
          );
        }
        return  ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, i) {
            return cityCard(
              context,
              homeCard: true,
              shimmercheck: true           
            );
          },
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
