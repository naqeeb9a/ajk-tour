import 'package:ajk_tour/app_screens/cities.dart';
import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class Districts extends StatefulWidget {
  const Districts({Key? key}) : super(key: key);

  @override
  _DistrictsState createState() => _DistrictsState();
}

class _DistrictsState extends State<Districts> {
  int selectedItem = 0;
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
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              push(
                context,
                Cities(
                  cityName: arrayLocal[selectedItem]["name"].toString(),
                  image: arrayLocal[selectedItem]["image"].toString(),
                ),
              );
            },
            child: ListWheelScrollView(
              diameterRatio: 5,
              itemExtent: dynamicHeight(context, .25),
              onSelectedItemChanged: (i) {
                selectedItem = i;
              },
              children: List.generate(
                arrayLocal.length,
                (i) => stateCard(
                  context,
                  arrayLocal[i]["image"],
                  arrayLocal[i]["name"],
                  Cities(
                    cityName: arrayLocal[i]["name"].toString(),
                    image: arrayLocal[i]["image"].toString(),
                  ),
                ),
              ).toList(),
            ),
          ),
          imageHeader(
            context,
            "https://www.visitswatvalley.com/images/naran-kaghan.jpg",
            "DISTRICTS",
            false,
            height: dynamicHeight(context, .3),
          ),
        ],
      ),
      // body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //       SliverAppBar(
      //         backgroundColor: myGrey,
      //         expandedHeight: dynamicHeight(context, .24),
      //         floating: false,
      //         pinned: true,
      //         flexibleSpace: LayoutBuilder(
      //           builder: (BuildContext context, BoxConstraints constraints) {
      //             return FlexibleSpaceBar(
      //               centerTitle: true,
      //               title: Text(
      //                 "Districts".toUpperCase(),
      //                 style: TextStyle(
      //                   color: constraints.biggest.height == 88
      //                       ? myBlack
      //                       : myWhite,
      //                   fontSize: dynamicWidth(context, .06),
      //                 ),
      //               ),
      //               background: Image.network(
      //                 "https://www.visitpk.com/wp-content/uploads/2018/03/paragliding-in-mountains-720x480.jpg",
      //                 fit: BoxFit.cover,
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ];
      //   },
      //
      // ),
    );
  }
}
