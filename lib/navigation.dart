import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

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
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 1000 ? 60 : 80,
                      height:
                          MediaQuery.of(context).size.width < 1000 ? 60 : 80,
                      child: Image.asset(
                        'assets/images/logos/bykakLogo_w.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    MediaQuery.of(context).size.width < 1000
                        ? Container()
                        : Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    navHover = value;
                                  });
                                  showNavDetail();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
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
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    navHover = value;
                                  });
                                  showNavDetail();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
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
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    navHover = value;
                                  });
                                  showNavDetail();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
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
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    navHover = value;
                                  });
                                  showNavDetail();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
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
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    navHover = value;
                                  });
                                  showNavDetail();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
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
                          MediaQuery.of(context).size.width < 1000
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
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
                    height: MediaQuery.of(context).size.width < 1000 ? 0 : 300,
                    color: blackColor,
                    child: Center(
                      child: SizedBox(
                        width: 800,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'menu-1',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: whiteColor,
                                    ),
                                  ),
                                  Text(
                                    'menu-2',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: whiteColor,
                                    ),
                                  ),
                                  Text(
                                    'menu-3',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: whiteColor,
                                    ),
                                  ),
                                  Text(
                                    'menu-4',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
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
    btnCurrentPage = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1400,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Instagram',
                      style: TextStyle(
                        fontSize: 14,
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
                        fontSize: 14,
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
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '개인정보취급방침',
                          style: TextStyle(
                            fontSize: 14,
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
                            fontSize: 14,
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
                            fontSize: 14,
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
                        fontSize: 14,
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
