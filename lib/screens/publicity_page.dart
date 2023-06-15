import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:kimjuhyeonbykak/navigation.dart';

class PublicityPage extends StatefulWidget {
  const PublicityPage({super.key});

  @override
  State<PublicityPage> createState() => _PublicityPageState();
}

class _PublicityPageState extends State<PublicityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              PublicityTitle(),
              PublicityContent(),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                ),
                child: Footer(),
              ),
            ],
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

// ---------- Publicity_Title -----------------------------------------------------------------------------------------------------
class PublicityTitle extends StatefulWidget {
  const PublicityTitle({super.key});

  @override
  State<PublicityTitle> createState() => _PublicityTitleState();
}

class _PublicityTitleState extends State<PublicityTitle> {
  publicityTitles() {
    if (publicityNum == 0) {
      setState(() {
        publicityTitle = '매거진';
      });
    } else if (publicityNum == 1) {
      setState(() {
        publicityTitle = '보도자료';
      });
    } else {
      setState(() {
        publicityTitle = '협찬';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (publicityNum == 0) {
      setState(() {
        publicityTitle = '매거진';
      });
    } else if (publicityNum == 1) {
      setState(() {
        publicityTitle = '보도자료';
      });
    } else {
      setState(() {
        publicityTitle = '협찬';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: c1BoxSize(context) + 200,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Stack(
            children: [
              Image.asset(
                width: MediaQuery.of(context).size.width,
                height: c1BoxSize(context) + 200,
                'assets/images/tailorAcademy_bg.png',
                fit: BoxFit.cover,
              ),
              Container(
                height: c1BoxSize(context) + 200,
                decoration: BoxDecoration(
                  color: whiteColor,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      blackColor.withOpacity(0),
                      whiteColor,
                    ],
                    stops: [0, 1],
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Text(
                        '매거진',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                    ),
                    Text(
                      '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ---------- Publicity_Content -----------------------------------------------------------------------------------------------------
class PublicityContent extends StatefulWidget {
  const PublicityContent({super.key});

  @override
  State<PublicityContent> createState() => _PublicityContentState();
}

class _PublicityContentState extends State<PublicityContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Container(
              width: 360,
              height: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(100),
              ),
              // child: ListView.builder(
              //   itemCount: subMenu[i].length,
              //   scrollDirection: Axis.horizontal,
              //   itemBuilder: (context, index) {
              //     return ElevatedButton(
              //       style: elevatedBtnTheme,
              //       onPressed: () {
              //         setState(() {
              //           publicityNum = 0;
              //         });
              //       },
              //       child: Text(
              //         subMenu[i][index],
              //         style: TextStyle(
              //           fontSize: publicityNum == 0 ? 14 : 13,
              //           fontWeight: publicityNum == 0
              //               ? FontWeight.bold
              //               : FontWeight.normal,
              //           color: whiteColor,
              //         ),
              //       ),
              //     );
              //   },
              // )
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      setState(() {
                        publicityNum = 0;
                      });
                      print(['매거진', '보도자료', '협찬'][publicityNum]);
                    },
                    child: Text(
                      '매거진',
                      style: TextStyle(
                        fontSize: publicityNum == 0 ? 14 : 13,
                        fontWeight: publicityNum == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      setState(() {
                        publicityNum = 1;
                      });
                      print(['매거진', '보도자료', '협찬'][publicityNum]);
                    },
                    child: Text(
                      '보도자료',
                      style: TextStyle(
                        fontSize: publicityNum == 1 ? 14 : 13,
                        fontWeight: publicityNum == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      setState(() {
                        publicityNum = 2;
                      });
                      print(['매거진', '보도자료', '협찬'][publicityNum]);
                    },
                    child: Text(
                      '협찬',
                      style: TextStyle(
                        fontSize: publicityNum == 2 ? 14 : 13,
                        fontWeight: publicityNum == 2
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FadeIn(
            child: publicityNum == 0
                ? MagazineScreen()
                : publicityNum == 1
                    ? NewsScreen()
                    : SponsorShipScreen(),
          ),
        ],
      ),
    );
  }
}

// ---------- Magazine -----------------------------------------------------------------------------------------------------
class MagazineScreen extends StatelessWidget {
  const MagazineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: Column(
        children: [
          GridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width < 800 ? 1 : 2,
              childAspectRatio: 3 / 2.3,
              mainAxisSpacing: 40,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: blackColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '주제',
                            style: TextStyle(
                              fontSize: h7FontSize(context),
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 8,
                            ),
                            child: Text(
                              '제목입니다.영어로 title입니다.',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                color: blackColor,
                              ),
                            ),
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ',
                            style: TextStyle(
                              fontSize: h7FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ---------- News -----------------------------------------------------------------------------------------------------
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: widgetSize(context),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: blackColor,
                      width: 2,
                    ),
                  ),
                ),
                padding: EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Container(
                      width: c1BoxSize(context),
                      height: c1BoxSize(context) - 40,
                      color: blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '주제',
                            style: TextStyle(
                              fontSize: h7FontSize(context),
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: Text(
                              '제목입니다.영어로 title입니다.',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                          ),
                          Text(
                            '23.06.06',
                            style: TextStyle(
                              fontSize: h7FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------- Sponsorship -----------------------------------------------------------------------------------------------------
class SponsorShipScreen extends StatelessWidget {
  const SponsorShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: widgetSize(context),
                height: c1BoxSize(context) + 200,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.2 / 1,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      color: blackColor,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
