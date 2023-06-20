import 'package:flutter/material.dart';

// ---------- Color -----------------------------------------------------------------------------------------------------
var bykakColor = const Color(0xFF205B48);
var blackColor = const Color(0xFF1E1E1E);
var greyColor = const Color(0xFF9E9E9E);
var lightGreyColor = const Color(0xFFEEEEEE);
var whiteColor = const Color(0xFFFFFFFF);

// ---------- Variable -----------------------------------------------------------------------------------------------------
int i = 0;
int publicityNum = 0;
int communityNum = 0;
int businessNum = 0;

int newsNum = 0;
int magazineNum = 0;

bool topState = true;

var elevatedBtnTheme = ElevatedButton.styleFrom(
  backgroundColor: whiteColor.withOpacity(0),
  shadowColor: whiteColor.withOpacity(0),
  elevation: 0,
);

bottomToTop(context, moveTop()) {
  return Container(
    width: double.infinity,
    height: 72,
    color: blackColor,
    child: ElevatedButton(
      style: elevatedBtnTheme,
      onPressed: () {
        moveTop();
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          '맨 위로 ↑',
          style: TextStyle(
            color: whiteColor,
            fontSize: h5FontSize(context),
          ),
        ),
      ),
    ),
  );
}

// ---------- Contents_Width -----------------------------------------------------------------------------------------------------
widgetSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 360;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 760;
  } else {
    return 1000;
  }
}

// ---------- Fonts_Size -----------------------------------------------------------------------------------------------------
h1FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 28;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 32;
  } else {
    return 36;
  }
}

h2FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 20;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 24;
  } else {
    return 28;
  }
}

h3FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 18;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 20;
  } else {
    return 24;
  }
}

h4FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 16;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 18;
  } else {
    return 20;
  }
}

h5FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 14;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 16;
  } else {
    return 18;
  }
}

h6FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 12;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 14;
  } else {
    return 16;
  }
}

h7FontSize(context) {
  if (MediaQuery.of(context).size.width < 800) {
    return 12;
  } else if (MediaQuery.of(context).size.width < 1240) {
    return 12;
  } else {
    return 14;
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