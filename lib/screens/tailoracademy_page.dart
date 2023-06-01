import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class TailorAcademyPage extends StatelessWidget {
  const TailorAcademyPage({super.key});

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
                TailorAcademyMain(),
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: WhatIsAcademy(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Curriculum(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: WhoTeaching(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: WhyLearning(),
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

// ---------- Tailor_Academy_Main -----------------------------------------------------------------------------------------------------
class TailorAcademyMain extends StatelessWidget {
  const TailorAcademyMain({super.key});

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
            'assets/images/tailorAcademy_bg.png',
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
                      'by 覺 Tailor Academy',
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
                        '바이각 테일러아카데미',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
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

// ---------- What_Is -----------------------------------------------------------------------------------------------------
academyLogo(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width < 800
        ? widgetSize(context)
        : c1BoxSize(context) + 100,
    child: Image.asset(
      'assets/images/logos/academyLogo.png',
      fit: BoxFit.fitWidth,
    ),
  );
}

academyText(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '바이각 테일러아카데미는',
        style: TextStyle(
          fontSize: h5FontSize(context),
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
      ),
      Text(
        '장인들의 맞춤양복 기술이 후대에도\n이어나갈 수 있도록 후학양성을 위해',
        style: TextStyle(
          fontSize: h2FontSize(context),
          fontWeight: FontWeight.bold,
          color: bykakColor,
        ),
      ),
      Text(
        '설립되었습니다.',
        style: TextStyle(
          fontSize: h5FontSize(context),
          color: blackColor,
        ),
      ),
    ],
  );
}

class WhatIsAcademy extends StatelessWidget {
  const WhatIsAcademy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        width: widgetSize(context),
        child: MediaQuery.of(context).size.width < 800
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  academyLogo(context),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: academyText(context),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  academyLogo(context),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: academyText(context),
                  ),
                ],
              ),
      ),
    );
  }
}

// ---------- Curriculum -----------------------------------------------------------------------------------------------------
class Curriculum extends StatelessWidget {
  const Curriculum({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          children: [
            Text(
              'Curriculum',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontFamily: 'Cafe_24',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width < 800 ? 40 : 100,
              ),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  children: [
                    Container(
                      width: widgetSize(context),
                      height: c1BoxSize(context),
                      color: blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 240,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: blackColor,
                          ),
                          child: Center(
                            child: Text(
                              '수강신청',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Who_Teaching -----------------------------------------------------------------------------------------------------
class WhoTeaching extends StatelessWidget {
  const WhoTeaching({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          children: [
            Text(
              'Instructor',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontFamily: 'Cafe_24',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width < 800 ? 40 : 100,
              ),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widgetSize(context),
                      height: c1BoxSize(context) + 100,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.touch,
                            PointerDeviceKind.trackpad,
                          },
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: c1BoxSize(context) + 20,
                              height: c1BoxSize(context) + 100,
                              margin: EdgeInsets.all(10),
                              color: blackColor,
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 8),
                          child: Text(
                            '양복기능대회 은메달리스트 김회문 선생님',
                            style: TextStyle(
                              fontSize: h2FontSize(context) - 2,
                              color: blackColor,
                            ),
                          ),
                        ),
                        Text(
                          '오랜시간을 맞춤양복 기술의 경력을 쌓아오신 분으로써\n여러 대회에서 수상을 하신 경력이 있으십니다.',
                          style: TextStyle(
                            fontSize: h6FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Why_Learning -----------------------------------------------------------------------------------------------------
class WhyLearning extends StatelessWidget {
  const WhyLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
