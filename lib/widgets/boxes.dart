import 'package:ajk_tour/app_screens/state_details.dart';
import 'package:ajk_tour/utils/app_routes.dart';
import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:flutter/material.dart';

Widget stateCard(context, image, text) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: dynamicHeight(context, .012),
    ),
    child: InkWell(
      onTap: () {
        push(
          context,
          const StateDetail(),
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
