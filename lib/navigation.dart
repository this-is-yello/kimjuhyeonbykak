import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:side_sheet/side_sheet.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
  List subMenuText = [
    '',
    '',
    '',
    '',
    '',
    // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 브랜드의 설명 the industrys standard dummy text ever since the 1500s',
    // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 홍보의 설명 the industrys standard dummy text ever since the 1500s',
    // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 제품 관련 설명 the industrys standard dummy text ever since the 1500s',
    // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 커뮤니티의 설명 the industrys standard dummy text ever since the 1500s',
    // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 비즈니스 관련 설명 the industrys standard dummy text ever since the 1500s',
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
  bool hoverColor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          mouseCursor: SystemMouseCursors.basic,
          onHover: (value) {
            setState(() {
              hoverColor = value;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width < 800 ? 56 : 64,
            color: hoverColor ? blackColor : blackColor.withOpacity(0.8),
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
                      child: SizedBox(
                        width: 110,
                        child: Image.asset(
                          width:
                              MediaQuery.of(context).size.width < 800 ? 56 : 64,
                          height:
                              MediaQuery.of(context).size.width < 800 ? 56 : 64,
                          darkState
                              ? 'assets/images/logos/bykakTextLogo_b.png'
                              : 'assets/images/logos/bykakTextLogo_w.png',
                          fit: BoxFit.fitWidth,
                        ),
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
                                  return InkWell(
                                    onTap: () {},
                                    onHover: (value) {
                                      setState(() {
                                        navBarHover = value;
                                        i = index;
                                      });
                                    },
                                    child: Container(
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
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor,
                                          ),
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
                            //   onHover: (value) {
                            //     setState(() {
                            //       hoverColor = value;
                            //     });
                            //   }
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
                            //       color: Color(0xFF1E1E1E),
                            //     ),
                            //   ),
                            // ),
                            ElevatedButton(
                              style: elevatedBtnTheme,
                              onPressed: () {
                                if (auth.currentUser?.uid != null &&
                                    inMypage == true) {
                                  auth.signOut();
                                  Get.rootDelegate.toNamed(Routes.MAIN);
                                  Future.delayed(Duration(milliseconds: 700),
                                      () {
                                    return ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Center(
                                        child: Text('로그아웃 되었습니다.'),
                                      ),
                                      backgroundColor: bykakColor,
                                    ));
                                  });
                                } else if (auth.currentUser?.uid == null) {
                                  Get.rootDelegate.toNamed(Routes.LOGIN);
                                  print(auth.currentUser?.uid);
                                } else if (auth.currentUser?.uid != null) {
                                  Get.rootDelegate.toNamed(Routes.MYPAGE);
                                }
                              },
                              child: Text(
                                auth.currentUser?.uid == null
                                    ? '로그인'
                                    : inMypage
                                        ? '로그아웃'
                                        : '마이페이지',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            child: Icon(
                              Icons.sunny,
                              color: whiteColor,
                              size: 20,
                            ),
                            onTap: () {
                              if (darkState == false) {
                                setState(() {
                                  darkState = true;
                                  blackColor = const Color(0xFFFFFFFF);
                                  whiteColor = const Color(0xFF1E1E1E);
                                });
                                print('다크모드 적용');
                              } else {
                                setState(() {
                                  darkState = false;
                                  blackColor = const Color(0xFF1E1E1E);
                                  whiteColor = const Color(0xFFFFFFFF);
                                });
                                print('다크모드 해제');
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
                      hoverColor = value;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    color: blackColor,
                    child: Center(
                      child: SizedBox(
                        width: widgetSize(context),
                        height: 60,
                        child: ListView.builder(
                          itemCount: subMenu[i].length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: whiteColor.withOpacity(0),
                                  shadowColor: whiteColor.withOpacity(0),
                                  alignment: Alignment.centerLeft,
                                  elevation: 0,
                                ),
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
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    subMenu[i][index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final url = Uri.parse(
                            'https://www.instagram.com/kimjuhyeon_by_kak/',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Text(
                          'Instagram',
                          style: TextStyle(
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () async {
                            final url = Uri.parse(
                              'https://blog.naver.com/kimjuhyeon_',
                            );
                            if (await canLaunchUrl(url)) {
                              launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: Text(
                            'Blog',
                            style: TextStyle(
                              fontSize: 12,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final url = Uri.parse(
                            'https://www.youtube.com/channel/UChLYML6MnztkeOYdtdAQqaw',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Text(
                          'Youtube',
                          style: TextStyle(
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.rootDelegate.toNamed(Routes.PRIVACY);
                        },
                        child: Text(
                          '개인정보취급방침',
                          style: TextStyle(
                            fontSize: 10,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: InkWell(
                          onTap: () {
                            Get.rootDelegate.toNamed(Routes.TERMS);
                          },
                          child: Text(
                            '이용약관',
                            style: TextStyle(
                              fontSize: 10,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.rootDelegate.toNamed(Routes.NOEMAIL);
                        },
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
                  Text(
                    '2023 DESIGNER ALL RIGHT RESERVED',
                    style: TextStyle(
                      fontSize: 10,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.rootDelegate.toNamed(Routes.MAIN);
                },
                child: SizedBox(
                  width: c5BoxSize(context) + 10,
                  height: c5BoxSize(context) + 10,
                  // color: blackColor,
                  child: Image.asset(
                    darkState
                        ? 'assets/images/logos/bykakLogo_w.png'
                        : 'assets/images/logos/bykakLogo_b.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
