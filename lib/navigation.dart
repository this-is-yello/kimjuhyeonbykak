import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
// import 'package:kimjuhyeonbykak/variable.dart';

import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';

// ---------- App_Bar -----------------------------------------------------------------------------------------------------
class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  bool navHover = false;
  var navBarColor;

  showNavDetail() {
    if (navHover == true) {
      setState(() {
        navBarColor = blackColor;
      });
    } else {
      setState(() {
        navBarColor = blackColor.withOpacity(0.8);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showNavDetail();
  }

  List subMenu = [
    ['스토리', '김주현바이각', '바이각 테일러아카데미', '신제물포구락부', '바이각 수트렌탈센터'],
    ['매거진', '보도자료', '협찬', 'CI·BI'],
    ['제품 보러가기'],
    ['문의하기', '공지사항', '이벤트', '미디어', '후기'],
    ['서포터즈', '협찬·협업 문의', '단체복 문의'],
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width < 1240 ? 80 : 100,
          color: navBarColor,
          // padding: const EdgeInsets.only(
          //   top: 20,
          //   bottom: 20,
          // ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SizedBox(
                width: widgetSize(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/');
                      },
                      child: SizedBox(
                        width:
                            MediaQuery.of(context).size.width < 1240 ? 60 : 80,
                        height:
                            MediaQuery.of(context).size.width < 1240 ? 60 : 80,
                        child: Image.asset(
                          'assets/images/logos/bykakLogo_w.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    MediaQuery.of(context).size.width < 800
                        ? Container()
                        : Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      navHover = value;
                                      i = 0;
                                    });
                                    showNavDetail();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    height:
                                        MediaQuery.of(context).size.width < 1240
                                            ? 80
                                            : 100,
                                    child: Center(
                                      child: Text(
                                        '브랜드',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      navHover = value;
                                      i = 1;
                                    });
                                    showNavDetail();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    height:
                                        MediaQuery.of(context).size.width < 1240
                                            ? 80
                                            : 100,
                                    child: Center(
                                      child: Text(
                                        '홍보',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      navHover = value;
                                      i = 2;
                                    });
                                    showNavDetail();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    height:
                                        MediaQuery.of(context).size.width < 1240
                                            ? 80
                                            : 100,
                                    child: Center(
                                      child: Text(
                                        '제품',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      navHover = value;
                                      i = 3;
                                    });
                                    showNavDetail();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    height:
                                        MediaQuery.of(context).size.width < 1240
                                            ? 80
                                            : 100,
                                    child: Center(
                                      child: Text(
                                        '커뮤니티',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      navHover = value;
                                      i = 4;
                                    });
                                    showNavDetail();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    height:
                                        MediaQuery.of(context).size.width < 1240
                                            ? 80
                                            : 100,
                                    child: Center(
                                      child: Text(
                                        '비즈니스',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      child: Row(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     right: 20,
                          //   ),
                          //   child: InkWell(
                          //     child: Text(
                          //       'KOR',
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         color: whiteColor,
                          //       ),
                          //     ),
                          //     onTap: () {},
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: InkWell(
                              child: Text(
                                '로그인',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: whiteColor,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                          MediaQuery.of(context).size.width < 800
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: InkWell(
                                    child: Icon(
                                      Icons.menu_rounded,
                                      size: 32,
                                      color: whiteColor,
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        navHover
            ? FadeIn(
                duration: Duration(milliseconds: 300),
                child: InkWell(
                  mouseCursor: MouseCursor.defer,
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      navHover = value;
                    });
                    showNavDetail();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width < 800 ? 0 : 280,
                    color: blackColor,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: SizedBox(
                          width: 800,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 160,
                                child: Center(
                                  child: ListView.builder(
                                    itemCount: subMenu[i].length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          bottom: 16,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(subMenuLinks[i][index]);
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
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the and typesetting industry.\nLorem Ipsum has been the standard dummy text ever since the 1500s\nLorem Ipsum is simply dummy text of the and typesetting industry.\nLorem Ipsum has been the standard dummy text ever since the 1500s',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: whiteColor,
                                ),
                              )
                            ],
                          ),
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
  void initState() {
    super.initState();
    btnCurrentPage = 0;
    print(btnCurrentPage);
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
                  Get.toNamed('/');
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
                      TextButton(
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
