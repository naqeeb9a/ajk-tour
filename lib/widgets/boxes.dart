import 'package:ajk_tour/app_screens/state_details.dart';
import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget stateCard(context, image, dynamic text,i) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .012),
    ),
    child: InkWell(
      onTap: () {
        push(
          context,
          StateDetail(
            stateName: text,
            image: image,
            i: i,
          ),
        );
      },
      child: Center(
        child: Container(
          width: dynamicWidth(context, .9),
          height: dynamicHeight(context, .2),
          decoration: BoxDecoration(
            color: myWhite,
            borderRadius: BorderRadius.circular(
              dynamicHeight(context, .02),
            ),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: myBlack.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(
              dynamicHeight(context, .02),
            ),
            color: myBlack.withOpacity(.4),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: myWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: dynamicWidth(context, .06),
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget stateDetailCard(context, image, placeName, state) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .012),
    ),
    child: InkWell(
      onTap: () {},
      child: Center(
        child: Container(
          width: dynamicWidth(context, .9),
          height: dynamicHeight(context, .26),
          decoration: BoxDecoration(
            color: myWhite,
            borderRadius: BorderRadius.circular(
              dynamicHeight(context, .012),
            ),
            boxShadow: [
              BoxShadow(
                color: myBlack.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    dynamicHeight(context, .012),
                  ),
                  topLeft: Radius.circular(
                    dynamicHeight(context, .012),
                  ),
                ),
                child: Image.asset(
                  image,
                  height: dynamicHeight(context, .18),
                  width: dynamicWidth(context, 1),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Flexible(
                child: Center(
                  child: SizedBox(
                    width: dynamicWidth(context, .8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          placeName,
                          style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: dynamicWidth(context, .056),
                          ),
                          maxLines: 1,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: myBlack.withOpacity(.5),
                                  size: dynamicWidth(context, .044),
                                ),
                              ),
                              TextSpan(
                                text: " $state",
                                style: TextStyle(
                                  color: myBlack.withOpacity(.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: dynamicWidth(context, .044),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}