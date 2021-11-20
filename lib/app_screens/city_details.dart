import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class CityDetail extends StatefulWidget {
  final String stateName, image;
  final int i, index;

  const CityDetail(
      {Key? key,
      required this.stateName,
      required this.image,
      required this.i,
      required this.index})
      : super(key: key);

  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(),
      body: Hero(
        tag: widget.stateName,
        child: Column(
          children: [
            imageHeader(
              context,
              widget.image.toString(),
              widget.stateName,
              true,
              assetImage: false,
            ),
            Flexible(
              child: SizedBox(
                width: dynamicWidth(context, 1),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: dynamicHeight(context, .024),
                  ),
                  child: FutureBuilder(
                    future:
                        ApiData().getInfo("places/" + widget.index.toString()),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return placeCard(
                              context,
                              image: snapshot.data[i]["image"].toString(),
                              placeName: snapshot.data[i]["name"].toString(),
                              city: widget.stateName,
                              latitude: snapshot.data[i]["latitude"].toString(),
                              longitude:
                                  snapshot.data[i]["longitude"].toString(),
                              description:
                                  snapshot.data[i]["description"].toString(),
                            );
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return placeCard(context, shimmerCheck: true);
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
