import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: dynamicWidth(context, 1),
                  height: dynamicHeight(context, .24),
                  color: myBlack,
                  padding: EdgeInsets.symmetric(
                    vertical: dynamicHeight(context, .03),
                    horizontal: dynamicWidth(context, .06),
                  ),
                  child: SafeArea(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        color: myWhite,
                        fontSize: dynamicWidth(context, .064),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: dynamicHeight(context, .11),
                  ),
                  child: Center(
                    child: SafeArea(
                      child: Container(
                        width: dynamicWidth(context, .34),
                        height: dynamicHeight(context, .16),
                        decoration: BoxDecoration(
                          color: myWhite,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: myBlack.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          size: dynamicHeight(context, .12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: dynamicHeight(context, .014),
              ),
              child: Container(
                width: dynamicWidth(context, .86),
                height: profileHeight == false
                    ? dynamicHeight(context, .1)
                    : dynamicHeight(context, .5),
                decoration: BoxDecoration(
                  color: myWhite,
                  borderRadius: BorderRadius.circular(
                    dynamicWidth(context, .02),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: myBlack.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(
                  dynamicHeight(context, .01),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "User Name",
                      style: TextStyle(
                        color: myBlack,
                        fontSize: dynamicWidth(context, .06),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          profileHeight = !profileHeight;
                        });
                      },
                      child: CircleAvatar(
                        radius: dynamicHeight(context, .024),
                        backgroundColor: noColor,
                        child: Icon(
                          profileHeight == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          size: dynamicHeight(context, .04),
                          color: myBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: dynamicHeight(context, .02),
            ),
            tiles(context, Icons.language, "Language"),
            tiles(context, Icons.language, "Language"),
            tiles(context, Icons.language, "Language"),
            tiles(context, Icons.language, "Language"),
          ],
        ),
      ),
    );
  }
}

Widget tiles(context, icon, text) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .01),
    ),
    child: Container(
      width: dynamicWidth(context, .8),
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
          size: dynamicHeight(context, .038),
          color: myBlack,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: dynamicWidth(context, .05),
            color: myBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: dynamicHeight(context, .03),
          color: myBlack,
        ),
      ),
    ),
  );
}
