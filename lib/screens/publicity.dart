import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/screens/brand/jemulpoclub_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/rentalcenter_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/tailoracademy_page.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:kimjuhyeonbykak/navigation.dart';

class PublicityPage extends StatelessWidget {
  const PublicityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  floating: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: c1BoxSize(context),
                  toolbarHeight: c1BoxSize(context) + 160,
                  backgroundColor: whiteColor,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(0),
                    background: Image.asset(
                      width: MediaQuery.of(context).size.width,
                      'assets/images/tailorAcademy_bg.png',
                      fit: BoxFit.cover,
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            width: widgetSize(context),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '홍보',
                                    style: TextStyle(
                                      fontSize: h1FontSize(context),
                                      // fontFamily: 'Cafe_24',
                                      fontWeight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 20,
                                    ),
                                    child: Text(
                                      '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
                                      style: TextStyle(
                                        fontSize: h6FontSize(context),
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widgetSize(context),
                          child: TabBar(
                            labelColor: whiteColor,
                            indicatorColor: whiteColor,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            unselectedLabelStyle:
                                TextStyle(fontWeight: FontWeight.normal),
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
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        Container(
                          color: Colors.red,
                        ),
                        Container(
                          color: Colors.green,
                        ),
                        Container(
                          color: Colors.blue,
                        ),
                        Container(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            MainAppBar(),
          ],
        ),
      ),
    );
  }
}

class PublicityTitle extends StatelessWidget {
  const PublicityTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: c1BoxSize(context) + 300,
            child: Image.asset(
              width: MediaQuery.of(context).size.width,
              'assets/images/tailorAcademy_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '홍보',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        // fontFamily: 'Cafe_24',
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text(
                        '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
                        style: TextStyle(
                          fontSize: h6FontSize(context),
                          color: whiteColor,
                        ),
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
