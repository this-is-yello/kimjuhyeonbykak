import 'package:flutter/material.dart';

var blackColor = Color(0xFF1E1E1E);
var greyColor = Color(0xFF9E9E9E);
var lightGreyColor = Color(0xFFEEEEEE);
var whiteColor = Color(0xFFFFFFFF);

widgetSize(c) {
  if (MediaQuery.of(c).size.width < 560) {
    return 380;
  } else if (MediaQuery.of(c).size.width < 1000) {
    return 520;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 940;
  } else if (MediaQuery.of(c).size.width < 1440) {
    return 1200;
  } else {
    return 1400;
  }
}
