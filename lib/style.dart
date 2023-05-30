import 'package:flutter/material.dart';

// ---------- Color -----------------------------------------------------------------------------------------------------
var blackColor = const Color(0xFF1E1E1E);
var greyColor = const Color(0xFF9E9E9E);
var lightGreyColor = const Color(0xFFEEEEEE);
var whiteColor = const Color(0xFFFFFFFF);

// ---------- Variable -----------------------------------------------------------------------------------------------------
int btnCurrentPage = 0;
int scrollCurrentPage = 0;

// ---------- Contents_Width -----------------------------------------------------------------------------------------------------
widgetSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 360;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 770;
  } else {
    return 1200;
  }
}

// ---------- Fonts_Size -----------------------------------------------------------------------------------------------------
h1FontSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 40;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 48;
  } else {
    return 56;
  }
}

h2FontSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 32;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 40;
  } else {
    return 48;
  }
}

h3FontSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 24;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 32;
  } else {
    return 40;
  }
}

h4FontSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 16;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 24;
  } else {
    return 32;
  }
}

h5FontSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 16;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 20;
  } else {
    return 24;
  }
}

h6FontSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 12;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 16;
  } else {
    return 20;
  }
}

h7FontSize(c) {
  if (MediaQuery.of(c).size.width < 800) {
    return 10;
  } else if (MediaQuery.of(c).size.width < 1240) {
    return 14;
  } else {
    return 18;
  }
}
