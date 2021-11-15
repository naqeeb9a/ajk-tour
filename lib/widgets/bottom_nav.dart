import 'package:ajk_tour/app_screens/home_page.dart';
import 'package:ajk_tour/app_screens/profile.dart';
import 'package:ajk_tour/app_screens/states.dart';
import 'package:ajk_tour/utils/config.dart';
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
      body: Container(
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentPage,
        onTap: (i) => setState(() => currentPage = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: primaryBlue,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.grid_view),
            title: const Text("States"),
            selectedColor: primaryBlue,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.supervised_user_circle_rounded),
            title: const Text("Profile"),
            selectedColor: primaryBlue,
          ),
        ],
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return const HomePage();
      case 1:
        return const States();
      case 2:
        return const Profile();
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
