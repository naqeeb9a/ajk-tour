import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

bool profileHeight = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: dynamicWidth(context, 1),
                    height: dynamicHeight(context, .24),
                    decoration: BoxDecoration(
                      color: myBlack,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/profile_bg.jpg",
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: dynamicHeight(context, .03),
                      horizontal: dynamicWidth(context, .06),
                    ),
                    child: SafeArea(
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          color: myWhite,
                          fontSize: dynamicWidth(context, .056),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: dynamicHeight(context, .164),
                    ),
                    child: Center(
                      child: SafeArea(
                        child: Container(
                          width: dynamicWidth(context, .3),
                          height: dynamicHeight(context, .14),
                          decoration: BoxDecoration(
                            color: myWhite,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: myBlack.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.person,
                            size: dynamicHeight(context, .1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: dynamicHeight(context, .02),
                ),
                child: Text(
                  "User Name",
                  style: TextStyle(
                    color: myBlack,
                    fontSize: dynamicWidth(context, .044),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: dynamicHeight(context, .06),
              ),
              tiles(context, Icons.person_outline_rounded, "Profile"),
              tiles(context, Icons.notifications_none_rounded, "Notifications"),
              tiles(context, Icons.language, "Language"),
              tiles(context, Icons.login_outlined, "Login"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget tiles(context, icon, text) {
  return Container(
    width: dynamicWidth(context, .76),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0.0,
      ),
      leading: Icon(
        icon,
        size: dynamicHeight(context, .032),
        color: myBlack,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: dynamicWidth(context, .042),
          color: myBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: dynamicHeight(context, .028),
        color: myBlack,
      ),
    ),
  );
}
