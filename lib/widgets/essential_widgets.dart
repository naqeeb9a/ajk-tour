import 'package:ajk_tour/utils/config.dart';
import 'package:flutter/material.dart';

customBar(text, {color = ""}) {
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(
        color: myBlack,
      ),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: color == "" ? myBlack : color,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
