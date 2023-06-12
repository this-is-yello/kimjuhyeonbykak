import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';

import 'package:kimjuhyeonbykak/navigation.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                StoryMain(),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      StoryTabBar(),
                      PublicityTabBarView(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width < 800
                              ? 120
                              : 160,
                        ),
                        child: Footer(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

// ---------- Story_Main -----------------------------------------------------------------------------------------------------
class StoryMain extends StatelessWidget {
  const StoryMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            'assets/images/story_bg.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 120),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By 覺 Story',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontFamily: 'Cafe_24',
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        '바이각스토리',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '바이각스토리~ 바이각스토뤼~ 바이가스토뤼~',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: whiteColor,
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
class StoryTabBar extends StatelessWidget {
  const StoryTabBar({super.key});

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
            text: 'CEO Message',
          ),
          Tab(
            text: '연혁',
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
            Container(
              width: widgetSize(context),
              height: 900,
              color: Colors.red,
            ),
            Container(
              width: widgetSize(context),
              height: 900,
              color: Colors.green,
            ),
            Container(
              width: widgetSize(context),
              height: 900,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
