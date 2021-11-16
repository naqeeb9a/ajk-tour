import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/boxes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class Districts extends StatefulWidget {
  const Districts({Key? key}) : super(key: key);

  @override
  _DistrictsState createState() => _DistrictsState();
}

class _DistrictsState extends State<Districts> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: myGrey,
        appBar: customBar("Districts"),
        body: ListView.builder(
          itemCount: arrayLocal.length,
          itemBuilder: (context, i) {
            return Hero(
              tag: i,
              child: Material(
                color: noColor,
                child: stateCard(
                    context, arrayLocal[i]["image"], arrayLocal[i]["name"], i),
              ),
            );
          },
        ),
      ),
    );
  }
}
