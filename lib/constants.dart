import 'package:flutter/material.dart';

Color KPrimaryColor = Color.fromRGBO(254, 206, 1, 1);

var KSearchBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color.fromRGBO(225, 225, 225, 1),
  ),
  borderRadius: BorderRadius.horizontal(
    left: Radius.circular(
      50,
    ),
  ),
);

var KTitleTextStyle = TextStyle(
  fontFamily: "Lato",
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

var KSmallTitleTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w500,
);

var KFilterChipBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(
    30,
  ),
  side: BorderSide(
    color: Color.fromRGBO(255, 255, 255, 0),
    width: 0,
  ),
);

var KProductCardBlueColor = Color.fromRGBO(216, 240, 253, 1);
var KProductCardWhiteColor = Color.fromRGBO(245, 247, 249, 1);
Color KSelectedChipColor = KPrimaryColor;
Color KChipColor = Color.fromRGBO(233, 233, 233, 1);

var KPrimaryButtonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
  foregroundColor: MaterialStateProperty.all(Colors.black),
  backgroundColor: MaterialStateProperty.all(KPrimaryColor),
);
