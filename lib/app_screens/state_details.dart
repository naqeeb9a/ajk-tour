import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class StateDetail extends StatefulWidget {
  dynamic stateName, image;

  StateDetail({Key? key, this.stateName, this.image}) : super(key: key);

  @override
  _StateDetailState createState() => _StateDetailState();
}

class _StateDetailState extends State<StateDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myGrey,
        body: Column(
          children: [
            SizedBox(
              width: dynamicWidth(context, 1),
              height: dynamicHeight(context, .22),
              child: Stack(
                children: [
                  SizedBox(
                    width: dynamicWidth(context, 1),
                    height: dynamicHeight(context, .22),
                    child: Image.asset(
                      widget.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: dynamicWidth(context, 1),
                    height: dynamicHeight(context, .22),
                    color: myBlack.withOpacity(.4),
                  ),
                  SizedBox(
                    width: dynamicWidth(context, 1),
                    height: dynamicHeight(context, .22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customBar("", color: myWhite),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: dynamicHeight(context, .02),
                          ),
                          child: Text(
                            widget.stateName,
                            style: TextStyle(
                              color: myWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: dynamicWidth(context, .08),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: dynamicWidth(context, 1),
              height: dynamicHeight(context, .7),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: dynamicHeight(context, .024),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return stateDetailCard(
                        context, "assets/1.jpg", "place abc", "Mirpur");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
