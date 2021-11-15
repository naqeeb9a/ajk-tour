import 'package:ajk_tour/utils/config.dart';
import 'package:flutter/material.dart';

customBar(
  text,
) {
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(
        color: myBlack,
      ),
    ),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: myBlack,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
