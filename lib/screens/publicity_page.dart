import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';

import 'package:kimjuhyeonbykak/navigation.dart';

class PublicityPage extends StatefulWidget {
  const PublicityPage({super.key});

  @override
  State<PublicityPage> createState() => _PublicityPageState();
}

class _PublicityPageState extends State<PublicityPage> {
  // late TabController _tabController;

  // int tabNum = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(
  //     length: 4,
  //     vsync: this,
  //     // initialIndex: tabNum,
  //   );
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            children: [
              PublicityTitle(),
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    PublicityTabBar(),
                    PublicityTabBarView(),
                    Padding(
                      padding: EdgeInsets.only(
                        top:
                            MediaQuery.of(context).size.width < 800 ? 120 : 160,
                      ),
                      child: Footer(),
                    ),
                  ],
                ),
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
class PublicityTitle extends StatelessWidget {
  const PublicityTitle({super.key});

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
                        '홍보',
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

// ---------- TabBar -----------------------------------------------------------------------------------------------------
class PublicityTabBar extends StatelessWidget {
  const PublicityTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: whiteColor,
      child: TabBar(
        labelColor: blackColor,
        indicatorColor: blackColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
        ),
        tabs: [
          Tab(
            text: '매거진',
          ),
          Tab(
            text: '보도자료',
          ),
          Tab(
            text: '협찬',
          ),
          Tab(
            text: 'CI·BI',
          ),
        ],
      ),
    );
  }
}

// ---------- TabBar_View -----------------------------------------------------------------------------------------------------
class PublicityTabBarView extends StatelessWidget {
  const PublicityTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 40,
        right: 20,
      ),
      child: SizedBox(
        width: widgetSize(context),
        // height: MediaQuery.of(context).size.longestSide,
        child: AutoScaleTabBarView(
          children: [
            MagazineScreen(),
            NewsScreen(),
            SponsorShipScreen(),
            CiBiScreen(),
          ],
        ),
      ),
    );
  }
}

// ---------- Magazine -----------------------------------------------------------------------------------------------------
class MagazineScreen extends StatelessWidget {
  const MagazineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          mainAxisAlignment: MainAxisAlignment.start,
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
                      // width: c1BoxSize(context) + 20,
                      // height: c1BoxSize(context) + 100,
                      // margin: EdgeInsets.all(10),
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

// ---------- CI·BI -----------------------------------------------------------------------------------------------------
class CiBiScreen extends StatelessWidget {
  const CiBiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: Column(
        children: [
          Container(
            width: widgetSize(context),
            padding: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    '1. 로고',
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: widgetSize(context),
                    height: c1BoxSize(context),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: widgetSize(context),
            padding: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    '2. 심볼마크',
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: widgetSize(context),
                    height: c1BoxSize(context),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: widgetSize(context),
            padding: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    '3, 전용색상',
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: widgetSize(context),
                    height: c1BoxSize(context),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}