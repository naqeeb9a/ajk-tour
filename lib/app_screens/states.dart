import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
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
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
            return Hero(
              tag: i,
              child: Material(
                color: noColor,
                child: stateCard(context, "assets/1.jpg", "Mirpur", i),
              ),
            );
          },
        ),
      ),
    );
  }
}
