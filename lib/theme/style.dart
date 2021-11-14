import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color darkOrange = Color(0xED502E);
Color themeOranges = Color.fromRGBO(255, 88, 33, 0.6);

bgGradient() {
  return LinearGradient(
    colors: [
      Color(0xFEF1E7),
      darkOrange.withOpacity(0.2),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
