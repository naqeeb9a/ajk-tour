import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:flutter/material.dart';

import 'city_details.dart';

class Cities extends StatefulWidget {
  final String cityName, image;

  const Cities({Key? key, required this.cityName, required this.image})
      : super(key: key);

  @override
  _CitiesState createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  dynamic top = 0.0;
  var arrayLocal = [
    {
      "image":
          "https://www.pakistantravelguide.pk/wp-content/uploads/2016/11/boating-at-mangla-dam.png",
      "name": "Mirpur"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Balakot_KunharRiver.jpg/440px-Balakot_KunharRiver.jpg",
      "name": "Balakot"
    },
    {
      "image": "https://www.visitswatvalley.com/images/naran-kaghan.jpg",
      "name": "Naran"
    },
    {
      "image":
          "https://www.visitpk.com/wp-content/uploads/2018/03/paragliding-in-mountains-720x480.jpg",
      "name": "Toli peer"
    }
  ];

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
                color: top <= 88 ? myBlack : myWhite,
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.cityName.toUpperCase(),
                      style: TextStyle(
                        color: top <= 88 ? myBlack : myWhite,
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
          child: ListView.builder(
            itemCount: arrayLocal.length,
            itemBuilder: (context, i) {
              return Hero(
                tag: i,
                child: Material(
                  color: noColor,
                  child: stateCard(
                    context,
                    image: arrayLocal[i]["image"],
                    text: arrayLocal[i]["name"],
                    page: CityDetail(
                      stateName: arrayLocal[i]["name"].toString(),
                      image: arrayLocal[i]["image"].toString(),
                      i: i,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
