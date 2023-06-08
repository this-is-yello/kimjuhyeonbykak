import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:kimjuhyeonbykak/navigation.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            children: [
              BusinessTitle(),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    BusinessTabBar(),
                    BusinessTabBarView(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                ),
                child: Footer(),
              ),
              Column(
                children: [],
              ),
            ],
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

// ---------- Busniess_Title -----------------------------------------------------------------------------------------------------
class BusinessTitle extends StatelessWidget {
  const BusinessTitle({super.key});

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
                'assets/images/tailorShop_bg.png',
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
                        '비즈니스',
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
class BusinessTabBar extends StatelessWidget {
  const BusinessTabBar({super.key});

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
            text: '서포터즈',
          ),
          Tab(
            text: '협찬·협업 문의',
          ),
          Tab(
            text: '단체복 문의',
          ),
        ],
      ),
    );
  }
}

// ---------- TabBar_View -----------------------------------------------------------------------------------------------------
class BusinessTabBarView extends StatelessWidget {
  const BusinessTabBarView({super.key});

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
        height: MediaQuery.of(context).size.height - (c1BoxSize(context) + 160),
        child: Center(
          child: TabBarView(
            children: [
              SupportersScreen(),
              SponInquiryScreen(),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Supporters -----------------------------------------------------------------------------------------------------
class SupportersScreen extends StatefulWidget {
  const SupportersScreen({super.key});

  @override
  State<SupportersScreen> createState() => _SupportersScreenState();
}

class _SupportersScreenState extends State<SupportersScreen> {
  bool supporterState = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                onTap: () {
                  setState(() {
                    supporterState = true;
                  });
                },
                child: Container(
                  height: c5BoxSize(context),
                  child: Center(
                    child: Text(
                      '각인(覺人)',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: blackColor,
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      supporterState = false;
                    });
                  },
                  child: Container(
                    height: c5BoxSize(context),
                    child: Center(
                      child: Text(
                        '엠버서더',
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: whiteColor,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        supporterState ? SupportersKakIn() : SupportersAmbassador(),
      ],
    );
  }
}

// ---------- KakIn ----------
class SupportersKakIn extends StatelessWidget {
  const SupportersKakIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'by 覺 을 시작으로 옷에 대해 보고, 배우고,\n깨닫길 바라며',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text Lorem Ipsum is simply dummy text of the printing and 멤버쉽입니다.',
                  style: TextStyle(
                    fontSize: h6FontSize(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '각인(覺人)',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: widgetSize(context),
                  height: c1BoxSize(context) + 200,
                  color: blackColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '마일리지 신청 및 등급 조회하기 >',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------- Ambassador ----------
class SupportersAmbassador extends StatelessWidget {
  const SupportersAmbassador({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '엠버서더는 엠버서더입니다.',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text Lorem Ipsum is simply dummy text of the printing and 엠버서더입니다.',
                  style: TextStyle(
                    fontSize: h6FontSize(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '바이각 엠버서더',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
                        child: Column(
                          children: [
                            SizedBox(
                              width: widgetSize(context),
                              height: c1BoxSize(context) + 200,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 1.2 / 1,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          // width: c1BoxSize(context),
                                          // height: c1BoxSize(context) + 20,
                                          // margin: EdgeInsets.all(10),
                                          color: blackColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          '엠버서더_$index\n@idimda_$index',
                                          style: TextStyle(
                                            fontSize: h5FontSize(context),
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '엠버서더 활동',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.5 / 1,
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 20,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : (widgetSize(context) / 3) - 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '컨텐츠 제작',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              '인스타그램, 유튜브 등에 게시될 사진,\n영상을 직접 제작하며 제품을 홍보',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: h6FontSize(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : (widgetSize(context) / 3) - 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '유저 유입과 구입',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              '컨텐츠를 접한 유저들이 직접\n인플루언서 추천코드로 아이템을 구매',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: h6FontSize(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : (widgetSize(context) / 3) - 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '수수료 정산',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              '구매확정이 완료되면, 판매 성과를\n기반으로 계약된 수수료 지급',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: h6FontSize(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '엠버서더 신청 >',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: blackColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '엠버서더 페이지 >',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------- SponInquiry -----------------------------------------------------------------------------------------------------
class SponInquiryScreen extends StatelessWidget {
  const SponInquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          '1. 기본정보',
          style: TextStyle(
            fontSize: h1FontSize(context),
            color: blackColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            alignment: WrapAlignment.start,
            spacing: 20,
            runSpacing: 20,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? widgetSize(context)
                    : widgetSize(context) / 2 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '회사명',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: widgetSize(context),
                      height: c6BoxSize(context),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: TextField(
                        // controller: _inputCompany,
                        cursorColor: blackColor,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : 김주현바이각',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? widgetSize(context)
                    : widgetSize(context) / 2 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '브랜드명',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: widgetSize(context),
                      height: c6BoxSize(context),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: TextField(
                        // controller: _inputBrand,
                        cursorColor: blackColor,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : 김주현바이각',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            alignment: WrapAlignment.start,
            spacing: 20,
            runSpacing: 20,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? widgetSize(context)
                    : widgetSize(context) / 2 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '담당자 이름 / 직급',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: widgetSize(context),
                      height: c6BoxSize(context),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: TextField(
                        // controller: _inputName,
                        cursorColor: blackColor,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : 홍길동 / 대리',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? widgetSize(context)
                    : widgetSize(context) / 2 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '이메일 주소',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: widgetSize(context),
                      height: c6BoxSize(context),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: TextField(
                        // controller: _inputMail,
                        cursorColor: blackColor,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : designercom@naver.com',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            alignment: WrapAlignment.start,
            spacing: 20,
            runSpacing: 20,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? widgetSize(context)
                    : widgetSize(context) / 2 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '참고 사이트 주소',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: widgetSize(context),
                      height: c6BoxSize(context),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: TextField(
                        // controller: _inputWeb,
                        cursorColor: blackColor,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : https://www.bykak.com/html/',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? widgetSize(context)
                    : widgetSize(context) / 2 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '연락처',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: widgetSize(context),
                      height: c6BoxSize(context),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: TextField(
                        // controller: _inputContact,
                        cursorColor: blackColor,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : 010-1234-1234 / 032-5678-5678',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Text(
            '2. 카테고리',
            style: TextStyle(
              fontSize: h1FontSize(context),
              color: blackColor,
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              onChanged: onChanged,
            )
          ],
        ),
        Container(
          width: widgetSize(context),
          height: c1BoxSize(context) + 200,
          padding: EdgeInsets.only(top: 40),
          child: TextField(
            // controller: _inputSub,
            cursorColor: blackColor,
            maxLines: 18,
            style: TextStyle(
              fontSize: h4FontSize(context),
              color: blackColor,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blackColor, width: 2),
              ),
              hintText: '내용을 입력하세요.',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: blackColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
