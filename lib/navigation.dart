import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';

// ---------- App_Bar -----------------------------------------------------------------------------------------------------
class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
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

  bool navBarHover = false;

  var navBarColor = blackColor.withOpacity(0.7);
  navBarColorState() {
    if (navBarHover == true) {
      setState(() {
        navBarColor = blackColor;
      });
    } else {
      setState(() {
        navBarColor = blackColor.withOpacity(0.7);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width < 1240 ? 80 : 100,
          color: navBarColor,
          child: Center(
            child: SizedBox(
              width: widgetSize(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FilledButton(
                  //   style: FilledButton.styleFrom(
                  //     backgroundColor: blackColor.withOpacity(0),
                  //   ),
                  //   onPressed: () {},
                  //   child: SizedBox(
                  //     // width: MediaQuery.of(context).size.width < 1240 ? 60 : 80,
                  //     // height:
                  //     //     MediaQuery.of(context).size.width < 1240 ? 60 : 80,
                  //     child: Image.asset(
                  //       'assets/images/logos/bykakLogo_w.png',
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.MAIN);
                    },
                    onHover: (value) {
                      if (value == true) {
                        setState(() {
                          navBarColor = blackColor;
                        });
                      } else {
                        setState(() {
                          navBarColor = blackColor.withOpacity(0.7);
                        });
                      }
                    },
                    child: Image.asset(
                      'assets/images/logos/bykakLogo_w.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  MediaQuery.of(context).size.width < 800
                      ? Container()
                      : Row(
                          children: [
                            ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 100,
                                  child: ElevatedButton(
                                    style: elevatedBtnTheme,
                                    onPressed: () {
                                      setState(() {
                                        publicityNum = 0;
                                        communityNum = 0;
                                        businessNum = 0;
                                      });
                                      Get.rootDelegate
                                          .toNamed(navsMenuLinks[index]);
                                    },
                                    onHover: (value) {
                                      setState(() {
                                        navBarHover = value;
                                        navBarColorState();
                                        i = index;
                                      });
                                    },
                                    child: Text(
                                      navsMenu[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                  Row(
                    children: [
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            style: elevatedBtnTheme,
                            onPressed: () {
                              Get.rootDelegate.toNamed(Routes.LOGIN);
                            },
                            onHover: (value) {
                              if (value == true) {
                                setState(() {
                                  navBarColor = blackColor;
                                });
                              } else {
                                setState(() {
                                  navBarColor = blackColor.withOpacity(0.7);
                                });
                              }
                            },
                            child: Text(
                              userMenu[1],
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                              ),
                            ),
                          );
                        },
                      ),
                      MediaQuery.of(context).size.width < 800
                          ? Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.menu_rounded,
                                  size: 32,
                                  color: whiteColor,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // ------------------------------ Sub_Menu ------------------------------
        navBarHover
            ? FadeIn(
                child: InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      navBarHover = value;
                      navBarColorState();
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: blackColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: widgetSize(context),
                              height: 40,
                              child: ListView.builder(
                                itemCount: subMenu[i].length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: ElevatedButton(
                                      style: elevatedBtnTheme,
                                      onPressed: () {
                                        setState(() {
                                          publicityNum = index;
                                          communityNum = index;
                                          businessNum = index;
                                        });
                                        Get.rootDelegate
                                            .toNamed(subMenuLinks[i][index]);
                                      },
                                      child: Text(
                                        subMenu[i][index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // Container(
                        //   width: widgetSize(context),
                        //   padding: EdgeInsets.only(left: 20, top: 60),
                        //   child: Text(
                        //     subMenuText[i],
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       color: whiteColor,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

// ---------- Footer -----------------------------------------------------------------------------------------------------
class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  void initState() {
    super.initState();
    btnCurrentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: blackColor,
            width: 2,
          ),
        ),
        color: whiteColor,
      ),
      child: Center(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.rootDelegate.toNamed(Routes.MAIN);
                },
                child: SizedBox(
                  width: c5BoxSize(context),
                  height: c5BoxSize(context),
                  // color: blackColor,
                  child: Image.asset(
                    'assets/images/logos/bykakLogo_b.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {},
                        child: Text(
                          'Instagram',
                          style: TextStyle(
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {},
                        child: Text(
                          'Blog',
                          style: TextStyle(
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {},
                        child: Text(
                          'Youtube',
                          style: TextStyle(
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {},
                        child: Text(
                          '개인정보취급방침',
                          style: TextStyle(
                            fontSize: 10,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {},
                        child: Text(
                          '이용약관',
                          style: TextStyle(
                            fontSize: 10,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {},
                        child: Text(
                          '이메일무단수집거부',
                          style: TextStyle(
                            fontSize: 10,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {},
                    child: Text(
                      '2023 DESIGNER ALL RIGHT RESERVED',
                      style: TextStyle(
                        fontSize: 10,
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
