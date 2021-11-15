import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class States extends StatefulWidget {
  const States({Key? key}) : super(key: key);

  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myGrey,
        appBar: customBar("States"),
        body: SizedBox(
          width: dynamicWidth(context, 1),
          height: dynamicHeight(context, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: dynamicHeight(context, .024),
            ),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, i) {
                return Hero(
                    tag: i,
                    child: Material(
                        child:
                            stateCard(context, "assets/1.jpg", "Mirpur", i)));
              },
            ),
          ),
        ),
      ),
    );
  }
}