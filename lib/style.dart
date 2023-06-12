import 'package:flutter/material.dart';

// ---------- Color -----------------------------------------------------------------------------------------------------
var bykakColor = const Color(0xFF205B48);
var blackColor = const Color(0xFF1E1E1E);
var greyColor = const Color(0xFF9E9E9E);
var lightGreyColor = const Color(0xFFEEEEEE);
var whiteColor = const Color(0xFFFFFFFF);

// ---------- Variable -----------------------------------------------------------------------------------------------------
int btnCurrentPage = 0;
int scrollCurrentPage = 0;

List subMenuLinks = [
  [
    '/story',
    '/tailorShop',
    '/tailorAcademy',
    '/newJemulpoClub',
    '/rentalCenter'
  ],
  ['/publicity', '/publicity', '/publicity'],
  ['/product'],
  ['/community', '/community', '/community', '/community', '/community'],
  ['business', 'business'],
];

// ---------- Contents_Width -----------------------------------------------------------------------------------------------------
widgetSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 360;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 770;
  } else {
    return 1200;
  }
}

// ---------- Fonts_Size -----------------------------------------------------------------------------------------------------
h1FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 24;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 32;
  } else {
    return 40;
  }
}

h2FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 20;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 28;
  } else {
    return 36;
  }
}

h3FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 20;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 28;
  } else {
    return 32;
  }
}

h4FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 16;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 20;
  } else {
    return 28;
  }
}

h5FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 14;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 16;
  } else {
    return 24;
  }
}

h6FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 12;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 16;
  } else {
    return 20;
  }
}

h7FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 10;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 14;
  } else {
    return 18;
  }
}

// ---------- Box_Size -----------------------------------------------------------------------------------------------------
c1BoxSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 120;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 160;
  } else {
    return 200;
  }
}

c2BoxSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 100;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 120;
  } else {
    return 160;
  }
}

c3BoxSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 80;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 100;
  } else {
    return 120;
  }
}

c4BoxSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 60;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 80;
  } else {
    return 100;
  }
}

c5BoxSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 40;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 60;
  } else {
    return 80;
  }
}

c6BoxSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 20;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 40;
  } else {
    return 60;
  }
}

// ---------- Padding_Size -----------------------------------------------------------------------------------------------------