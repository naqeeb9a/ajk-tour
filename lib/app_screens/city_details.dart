import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class CityDetail extends StatefulWidget {
  final String stateName, image;
  final int i;

  const CityDetail(
      {Key? key, required this.stateName, required this.image, required this.i})
      : super(key: key);

  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: widget.i,
        child: Scaffold(
          backgroundColor: myGrey,
          body: Column(
            children: [
              imageHeader(
                context,
                widget.image.toString(),
                widget.stateName,
                true,
              ),
              Flexible(
                child: SizedBox(
                  width: dynamicWidth(context, 1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: dynamicHeight(context, .024),
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        return stateDetailCard(
                            context, "assets/1.jpg", "place abc", "Mirpur");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
