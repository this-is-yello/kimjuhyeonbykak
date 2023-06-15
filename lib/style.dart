import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/main.dart';

// ---------- Color -----------------------------------------------------------------------------------------------------
var bykakColor = const Color(0xFF205B48);
var blackColor = const Color(0xFF1E1E1E);
var greyColor = const Color(0xFF9E9E9E);
var lightGreyColor = const Color(0xFFEEEEEE);
var whiteColor = const Color(0xFFFFFFFF);

// ---------- Variable -----------------------------------------------------------------------------------------------------
int btnCurrentPage = 0;
int scrollCurrentPage = 0;
int i = 0;

int publicityNum = 0;
int communityNum = 0;
int businessNum = 0;

var elevatedBtnTheme = ElevatedButton.styleFrom(
  backgroundColor: whiteColor.withOpacity(0),
  shadowColor: whiteColor.withOpacity(0),
  elevation: 0,
);

List navsMenu = ['브랜드', '홍보', '제품', '커뮤니티', '비즈니스'];
List navsMenuLinks = [
  Routes.STORY,
  Routes.PUBLICITY,
  Routes.PRODUCT,
  Routes.COMMUNITY,
  Routes.BUSINESS
];
List userMenu = ['KOR', '로그인'];

List subMenu = [
  ['바이각스토리', '김주현바이각', '바이각 테일러아카데미', '신제물포구락부', '바이각 수트렌탈센터'],
  ['매거진', '보도자료', '협찬'],
  ['제품 보러가기'],
  ['문의하기', '공지사항', '이벤트', '미디어'],
  ['서포터즈', '협찬·협업·단체복 문의'],
];
List subMenuLinks = [
  [
    Routes.STORY,
    Routes.TAILORSHOP,
    Routes.TAILORACADEMY,
    Routes.NEWJUMULPOCLUB,
    Routes.RENTALCENTER
  ],
  [Routes.PUBLICITY, Routes.PUBLICITY, Routes.PUBLICITY],
  [Routes.PRODUCT],
  [
    Routes.COMMUNITY,
    Routes.COMMUNITY,
    Routes.COMMUNITY,
    Routes.COMMUNITY,
    Routes.COMMUNITY
  ],
  [Routes.BUSINESS, Routes.BUSINESS],
];

var publicityTitle = ['매거진', '보도자료', '협찬'][publicityNum];
// var screenWidth = MediaQuery.of(context).size.width;
// var screenHeight = MediaQuery.of(context).size.height;

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