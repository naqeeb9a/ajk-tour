import 'package:ajk_tour/api/apis.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:flutter/material.dart';

import 'city_details.dart';

class Cities extends StatefulWidget {
  final String cityName, image;
  final int index;

  const Cities(
      {Key? key,
      required this.cityName,
      required this.image,
      required this.index})
      : super(key: key);

  @override
  _CitiesState createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  dynamic top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: myGrey,
              expandedHeight: dynamicHeight(context, .24),
              floating: false,
              pinned: true,
              iconTheme: IconThemeData(
                color: top == 88 ? myBlack : myWhite,
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.cityName.toUpperCase(),
                      style: TextStyle(
                        color: top == 88 ? myBlack : myWhite,
                        fontSize: dynamicWidth(context, .06),
                      ),
                    ),
                    collapseMode: CollapseMode.pin,
                    background: Stack(
                      children: [
                        Container(
                          width: dynamicWidth(context, 1),
                          height: dynamicHeight(context, 1),
                          color: myBlack.withOpacity(.6),
                          child: Image.network(
                            widget.image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: dynamicWidth(context, 1),
                          height: dynamicHeight(context, 1),
                          color: myBlack.withOpacity(.5),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: dynamicHeight(context, .02),
          ),
          child: FutureBuilder(
            future: ApiData().getInfo("cities/" + widget.index.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Hero(
                      tag: i,
                      child: Material(
                        color: noColor,
                        child: stateCard(
                          context,
                          image: snapshot.data[i]["image"].toString(),
                          text: snapshot.data[i]["name"].toString(),
                          page: CityDetail(
                            stateName: snapshot.data[i]["name"].toString(),
                            image: snapshot.data[i]["image"].toString(),
                            index: snapshot.data[i]["id"],
                            i: i,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
