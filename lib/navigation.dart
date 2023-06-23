import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:side_sheet/side_sheet.dart';
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

  bool langBtn = true;

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

  mobileMenu() async {
    // -------------------- Mobile_Menu --------------------
    return await SideSheet.right(
      context: context,
      width: MediaQuery.of(context).size.width * 0.9,
      body: Container(
        color: blackColor,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style: elevatedBtnTheme,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close_rounded,
                  size: 40,
                  color: whiteColor,
                ),
              ),
              ListView.builder(
                itemCount: navsMenu.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: elevatedBtnTheme,
                      onPressed: () async {
                        setState(() {
                          i = index;
                        });
                        // -------------------- Mobile_SubMenu --------------------
                        await SideSheet.left(
                          context: context,
                          width: MediaQuery.of(context).size.width * 0.8,
                          body: Container(
                            color: whiteColor,
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: elevatedBtnTheme,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      size: 40,
                                      color: blackColor,
                                    ),
                                  ),
                                  ListView.builder(
                                    itemCount: subMenu[i].length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: elevatedBtnTheme,
                                          onPressed: () {
                                            setState(() {
                                              publicityNum = index;
                                              communityNum = index;
                                              businessNum = index;
                                            });
                                            Get.rootDelegate.toNamed(
                                                subMenuLinks[i][index]);
                                            print(subMenu[i][index]);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 16,
                                              bottom: 16,
                                            ),
                                            child: Text(
                                              subMenu[i][index],
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: blackColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 160,
                                    padding: EdgeInsets.only(
                                      bottom: 40,
                                    ),
                                    child: Image.asset(
                                      'assets/images/logos/bykakLogo_b.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          navsMenu[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: 160,
                padding: EdgeInsets.only(
                  bottom: 40,
                ),
                child: Image.asset(
                  'assets/images/logos/bykakLogo_w.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool navBarHover = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width < 800 ? 56 : 64,
          color: blackColor,
          child: Center(
            child: SizedBox(
              width: widgetSize(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.MAIN);
                    },
                    child: Image.asset(
                      width: MediaQuery.of(context).size.width < 800 ? 56 : 64,
                      height: MediaQuery.of(context).size.width < 800 ? 56 : 64,
                      'assets/images/logos/bykakScissorLogo_w.png',
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
                      ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
// -------------------------------------------------- 언어변환 --------------------------------------------------
                          // ElevatedButton(
                          //   style: elevatedBtnTheme,
                          //   onPressed: () {
                          //     setState(() {
                          //       if (langBtn == true) {
                          //         langBtn = false;
                          //       } else {
                          //         langBtn = true;
                          //       }
                          //     });
                          //   },
                          //   child: Text(
                          //     langBtn ? KOR : ENG,
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       color: whiteColor,
                          //     ),
                          //   ),
                          // ),
                          ElevatedButton(
                            style: elevatedBtnTheme,
                            onPressed: () {
                              if (auth.currentUser?.uid != null) {
                                print('마이페이지');
                                // auth.signOut();
                              } else if (auth.currentUser?.uid == null) {
                                Get.rootDelegate.toNamed(Routes.LOGIN);
                                print(auth.currentUser?.uid);
                              }
                            },
                            child: Text(
                              auth.currentUser?.uid == null ? '로그인' : '마이페이지',
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MediaQuery.of(context).size.width < 800
                          ? Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: InkWell(
                                onTap: () async {
                                  setState(() {
                                    publicityNum = 0;
                                    communityNum = 0;
                                    businessNum = 0;
                                  });
                                  mobileMenu();
                                },
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: blackColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: widgetSize(context),
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
                                    print(subMenu[i][index]);
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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
          width: widgetSize(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.rootDelegate.toNamed(Routes.MAIN);
                },
                child: SizedBox(
                  width: c4BoxSize(context),
                  height: c4BoxSize(context),
                  // color: blackColor,
                  child: Image.asset(
                    'assets/images/logos/bykakLogo_b.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              // Container(
              //   width: 100,
              //   height: 100,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextButton(
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
                      TextButton(
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
                      TextButton(
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
                      TextButton(
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
                      TextButton(
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
                      TextButton(
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
                  TextButton(
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
