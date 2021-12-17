import 'package:ajk_tour/app_screens/districts.dart';
import 'package:ajk_tour/app_screens/home_page.dart';
import 'package:ajk_tour/app_screens/settings.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      body: Center(
        child: _getPage(currentPage),
      ),
      bottomNavigationBar: SizedBox(
        height: dynamicHeight(context, .07),
        child: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                Icons.home,
                size: dynamicWidth(context, .056),
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: dynamicWidth(context, .036),
                ),
              ),
              selectedColor: myBlack,
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.grid_view_rounded,
                size: dynamicWidth(context, .056),
              ),
              title: Text(
                "Districts",
                style: TextStyle(
                  fontSize: dynamicWidth(context, .036),
                ),
              ),
              selectedColor: myBlack,
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.settings,
                size: dynamicWidth(context, .056),
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: dynamicWidth(context, .036),
                ),
              ),
              selectedColor: myBlack,
            ),
          ],
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return const HomePage();
      case 1:
        return const Districts();
      case 2:
        return const Settings();
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              ('TabBar Index Error'),
            ),
          ],
        );
    }
  }
}
