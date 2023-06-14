import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';

import 'package:kimjuhyeonbykak/navigation.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
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
              CommunityTitle(),
              CommunityContent(),
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

// ---------- Community_Title -----------------------------------------------------------------------------------------------------
class CommunityTitle extends StatelessWidget {
  const CommunityTitle({super.key});

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
                'assets/images/jemulpoClub_bg.png',
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
                        '커뮤니티',
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

// ---------- Community_View -----------------------------------------------------------------------------------------------------
class CommunityContent extends StatefulWidget {
  const CommunityContent({super.key});

  @override
  State<CommunityContent> createState() => _CommunityContentState();
}

class _CommunityContentState extends State<CommunityContent> {
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
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      setState(() {
                        communityNum = 0;
                      });
                    },
                    child: Text(
                      '문의하기',
                      style: TextStyle(
                        fontSize: communityNum == 0 ? 14 : 13,
                        fontWeight: communityNum == 0
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
                        communityNum = 1;
                      });
                    },
                    child: Text(
                      '공지사항',
                      style: TextStyle(
                        fontSize: communityNum == 1 ? 14 : 13,
                        fontWeight: communityNum == 1
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
                        communityNum = 2;
                      });
                    },
                    child: Text(
                      '이벤트',
                      style: TextStyle(
                        fontSize: communityNum == 2 ? 14 : 13,
                        fontWeight: communityNum == 2
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
                        communityNum = 3;
                      });
                    },
                    child: Text(
                      '미디어',
                      style: TextStyle(
                        fontSize: communityNum == 3 ? 14 : 13,
                        fontWeight: communityNum == 3
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
            child: communityNum == 0
                ? InquiryScreen()
                : communityNum == 1
                    ? NotificationScreen()
                    : communityNum == 2
                        ? EventScreen()
                        : MediaScreen(),
          ),
        ],
      ),
    );
  }
}

// ---------- Inquiry -----------------------------------------------------------------------------------------------------
class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  List<String> inquiryDropDown = [
    '주제를 선택하세요.',
    '맞춤정장',
    '아카데미',
    '스튜디오',
    '렌탈센터',
    '기타'
  ];
  String _selectedValue = '주제를 선택하세요.';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widgetSize(context),
          height: c5BoxSize(context),
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: blackColor,
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: c4BoxSize(context),
                  child: Text(
                    '이름',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  // controller: _inputName,
                  style: TextStyle(
                    fontSize: h4FontSize(context),
                    color: blackColor,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: '이름을 입력하세요.',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: widgetSize(context),
          height: c5BoxSize(context),
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: blackColor,
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: c4BoxSize(context),
                  child: Text(
                    '전화번호',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  // controller: _inputPhone,
                  style: TextStyle(
                    fontSize: h4FontSize(context),
                    color: blackColor,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '전화번호을 입력하세요.',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: widgetSize(context),
          height: c5BoxSize(context),
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: blackColor,
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: c4BoxSize(context),
                  child: Text(
                    '이메일',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  // controller: _inputMail,
                  style: TextStyle(
                    fontSize: h4FontSize(context),
                    color: blackColor,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: '이메일을 입력하세요.',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: widgetSize(context),
          height: c3BoxSize(context),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: DropdownButton(
            dropdownColor: whiteColor,
            isExpanded: true,
            value: _selectedValue,
            underline: SizedBox.shrink(),
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            items: inquiryDropDown.map(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                    ),
                  ),
                );
              },
            ).toList(),
            onChanged: (dynamic value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ),
        Container(
          width: widgetSize(context),
          height: c1BoxSize(context) + 200,
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

// ---------- Notification -----------------------------------------------------------------------------------------------------
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
                height: c5BoxSize(context),
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: blackColor,
                      width: 2,
                    ),
                  ),
                ),
                // padding: EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '[공지사항] 공지사항은 읽어줬으면..',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
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
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------- Event -----------------------------------------------------------------------------------------------------
class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: GridView.builder(
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
    );
  }
}

// ---------- Media -----------------------------------------------------------------------------------------------------
class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widgetSize(context),
          child: InkWell(
            onTap: () {},
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
                      : widgetSize(context) / 2 - 10,
                  height: c1BoxSize(context) + 100,
                  color: blackColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width < 800
                      ? widgetSize(context)
                      : widgetSize(context) / 2,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width < 800 ? 0 : 16,
                  ),
                  child: Text(
                    '바이각 유튜브 영상이라던가?',
                    style: TextStyle(
                      fontSize: h3FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
            width: widgetSize(context),
            height: c1BoxSize(context),
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
                // itemCount: ,
                itemBuilder: (context, index) {
                  return Container(
                    width: c1BoxSize(context) + 40,
                    height: c1BoxSize(context),
                    margin: EdgeInsets.only(right: 16),
                    color: blackColor,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
