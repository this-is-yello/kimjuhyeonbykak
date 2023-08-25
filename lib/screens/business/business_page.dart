import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:kimjuhyeonbykak/screens/privacy/privacy_page.dart';

import 'package:get/get.dart';
// import 'package:image_fade/image_fade.dart';
import 'package:animate_do/animate_do.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  final ScrollController _scrollController = ScrollController();

  scrollState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent ||
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        setState(() {
          topState = true;
        });
      } else {
        setState(() {
          topState = false;
        });
      }
    });
  }

  moveTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    topState = true;
    inMypage = false;
    scrollState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            controller: _scrollController,
            children: [
              BusinessContent(),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                ),
                child: Footer(),
              ),
              bottomToTop(context, () => moveTop()),
            ],
          ),
          MainAppBar(),
        ],
      ),
      floatingActionButton: topState
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: FloatingActionButton(
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 30,
                ),
                backgroundColor: bykakColor,
                onPressed: () {
                  moveTop();
                },
              ),
            ),
    );
  }
}

// ---------- Business_Content -----------------------------------------------------------------------------------------------------
class BusinessContent extends StatefulWidget {
  const BusinessContent({super.key});

  @override
  State<BusinessContent> createState() => _BusinessContentState();
}

class _BusinessContentState extends State<BusinessContent> {
  List businessTitle = ['서포터즈', '협찬·협업·단체복 문의'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
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
                      'assets/images/background/tailor_shop_bg.png',
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
                              businessTitle[businessNum],
                              style: TextStyle(
                                fontSize: h1FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                          ),
                          // Text(
                          //   '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
                          //   style: TextStyle(
                          //     fontSize: h5FontSize(context),
                          //     color: blackColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
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
                            businessNum = 0;
                          });
                        },
                        child: Text(
                          '서포터즈',
                          style: TextStyle(
                            fontSize: businessNum == 0 ? 14 : 13,
                            fontWeight: businessNum == 0
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
                            businessNum = 1;
                          });
                        },
                        child: Text(
                          '협찬·협업·단체복 문의',
                          style: TextStyle(
                            fontSize: businessNum == 1 ? 14 : 13,
                            fontWeight: businessNum == 1
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
                child:
                    businessNum == 0 ? SupportersScreen() : SponInquiryScreen(),
              ),
            ],
          ),
        ],
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
    return SizedBox(
      width: widgetSize(context),
      child: Column(
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
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        '각인(覺人)',
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: supporterState ? whiteColor : blackColor,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: blackColor, width: 2),
                      color: supporterState ? blackColor : whiteColor,
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
                      padding: EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                          '엠버서더',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            color: supporterState ? blackColor : whiteColor,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: blackColor, width: 2),
                        color: supporterState ? whiteColor : blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          supporterState ? SupportersKakIn() : SupportersAmbassador(),
        ],
      ),
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
            top: 56,
          ),
          child: SizedBox(
            width: widgetSize(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'by 覺을 시작으로\n옷에 대해 보고, 배우고, 깨닫길 바라며',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '수많은 맞춤정장샵 사이에 by 覺을 선택해주시고 믿고 구매해주셔서 진심으로 감사드리며, 그동안 저희를 사랑해주셨던 분들이 우리 브랜드의 근간임을 잊은 적이 없습니다. 그렇기에 그 사랑을 보답하고자, 그리고 더욱 고객님에게 각인되고 친근하게 소통하고자 탄생한 멤버쉽 제도입니다.',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
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
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: widgetSize(context),
                  child: Image.asset(
                    'assets/images/kakin.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: InkWell(
                  onTap: () async {
                    final url = Uri.parse(
                      'https://su-it.net/',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: Text(
                    '마일리지 신청 및 등급 조회하기 >',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      fontWeight: FontWeight.bold,
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
class SupportersAmbassador extends StatefulWidget {
  const SupportersAmbassador({super.key});

  @override
  State<SupportersAmbassador> createState() => _SupportersAmbassadorState();
}

class _SupportersAmbassadorState extends State<SupportersAmbassador> {
  var userSearch;
  var ambassadorSearch;
  var ambassadorLength;

  searchAmbassador() async {
    try {
      userSearch = await firestore
          .collection('account')
          .where('grade', isEqualTo: '엠버서더')
          .get()
          .then((value) {
        setState(() {
          ambassadorSearch = value.docs;
          ambassadorLength = value.docs.length;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    searchAmbassador();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 56,
          ),
          child: SizedBox(
            width: widgetSize(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '올바르게 갖춰입는다는 것이\n우리의 삶을 더욱 윤택하게 만든다.',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20),
                //   child: Text(
                //     '엠버서더 관련 화면들은 데시그너로 넘어가는데.. 엠버서더 소개말을 뭐라고 정해야될지 생각해야합니다.',
                //     style: TextStyle(
                //       fontSize: h5FontSize(context),
                //     ),
                //   ),
                // ),
              ],
            ),
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
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 30,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : (widgetSize(context) / 3) - 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '1. 컨텐츠 제작',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              '인스타그램, 유튜브 등에 게시될 사진,\n영상을 직접 제작하며 제품을 홍보',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: h5FontSize(context) + 2,
                                color: blackColor,
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
                            '2. 유저 유입과 구입',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              '컨텐츠를 접한 유저들이 직접\n인플루언서 추천코드로 아이템을 구매',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: h5FontSize(context) + 2,
                                color: blackColor,
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
                            '3. 수수료 정산',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              '구매확정이 완료되면, 판매 성과를\n기반으로 계약된 수수료 지급',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: h5FontSize(context) + 2,
                                color: blackColor,
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
                padding: EdgeInsets.only(
                  top: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '엠버서더 혜택',
                      style: TextStyle(
                        fontSize: h3FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: widgetSize(context),
                        child: fadeImage('assets/images/benefit.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.rootDelegate.toNamed(Routes.AMBASSADORPROCESS);
                      },
                      child: Text(
                        '엠버서더 신청 >',
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: () async {
                          final url = Uri.parse(
                            'http://xn--2i0b31d0uch0z.com/shop/partner/login.php',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Text(
                          '엠버서더 페이지 >',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            fontWeight: FontWeight.bold,
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
class SponInquiryScreen extends StatefulWidget {
  const SponInquiryScreen({super.key});

  @override
  State<SponInquiryScreen> createState() => _SponInquiryScreenState();
}

class _SponInquiryScreenState extends State<SponInquiryScreen> {
  bool _checkSponsorship = false;
  bool _checkCoperation = false;
  bool _checkUniform = false;

  bool _checkPrivacy = false;

  var _inputInquiryCompany = TextEditingController();
  var _inputInquiryName = TextEditingController();
  var _inputInquiryWeb = TextEditingController();
  var _inputInquiryMail = TextEditingController();
  var _inputInquiryPhone = TextEditingController();
  var _inputInquiry = TextEditingController();

  goInquiry() async {
    if (_inputInquiryCompany.text == '' ||
        _inputInquiryName.text == '' ||
        _inputInquiryPhone.text == '' ||
        _inputInquiryMail.text == '' ||
        _inputInquiry.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(child: Text('입력되지 않은 정보가 있습니다.')),
        backgroundColor: bykakColor,
      ));
    } else {
      try {
        var inquiryData = await firestore
            .collection('businessInquiry')
            .doc(DateTime.now().toString())
            .set({
          'company': _inputInquiryCompany.text,
          'name': _inputInquiryName.text,
          'web': _inputInquiryWeb.text,
          'title': '${_inputInquiryName.text}님의 문의입니다.',
          'date': DateTime.now().toString(),
          'phone': _inputInquiryPhone.text,
          'mail': _inputInquiryMail.text,
          'value': _checkSponsorship
              ? '협찬'
              : _checkCoperation
                  ? '협업'
                  : _checkUniform
                      ? '단체복'
                      : '비즈니스',
          'inquiry': _inputInquiry.text,
          'aState': '답변 대기중',
        });
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            child: Text('문의가 등록되었습니다.'),
          ),
          backgroundColor: bykakColor,
        ));
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(child: Text('잘못된 입력 방법입니다. 다시 입력해주세요.')),
          backgroundColor: bykakColor,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: widgetSize(context),
            child: Text(
              '1. 기본정보',
              style: TextStyle(
                fontSize: h2FontSize(context),
                color: blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: widgetSize(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '회사명',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _inputInquiryCompany,
                    cursorColor: blackColor,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      color: blackColor,
                    ),
                    decoration: InputDecoration(
                      hintText: '예시 : 김주현바이각',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    height: 2,
                    color: blackColor,
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
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '담당자 이름 / 직급',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _inputInquiryName,
                        cursorColor: blackColor,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : 홍길동 / 대리',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: blackColor,
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
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '참고 사이트 주소',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _inputInquiryWeb,
                        cursorColor: blackColor,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : https://www.bykak.com/html/',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: blackColor,
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
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '이메일 주소',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _inputInquiryMail,
                        cursorColor: blackColor,
                        keyboardType: TextInputType.url,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : designercom@naver.com',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: blackColor,
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
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '연락처',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _inputInquiryPhone,
                        cursorColor: blackColor,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '예시 : 010-1234-1234 / 032-5678-5678',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: SizedBox(
              width: widgetSize(context),
              child: Text(
                '2. 카테고리',
                style: TextStyle(
                  fontSize: h2FontSize(context),
                  color: blackColor,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '협찬 문의',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Checkbox(
                    activeColor: blackColor,
                    checkColor: whiteColor,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return blackColor.withOpacity(.32);
                      }
                      return blackColor;
                    }),
                    value: _checkSponsorship,
                    onChanged: (bool? value) {
                      if (_checkCoperation == true || _checkUniform == true) {
                        setState(() {
                          _checkCoperation = false;
                          _checkUniform = false;
                          _checkSponsorship = value!;
                        });
                      } else {
                        setState(() {
                          _checkSponsorship = value!;
                        });
                      }
                      print('협찬 문의 : $value');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '협업 문의',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Checkbox(
                    activeColor: blackColor,
                    checkColor: whiteColor,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return blackColor.withOpacity(.32);
                      }
                      return blackColor;
                    }),
                    value: _checkCoperation,
                    onChanged: (bool? value) {
                      if (_checkSponsorship == true || _checkUniform == true) {
                        setState(() {
                          _checkUniform = false;
                          _checkSponsorship = false;
                          _checkCoperation = value!;
                        });
                      } else {
                        setState(() {
                          _checkCoperation = value!;
                        });
                      }
                      print('협업 문의 : $value');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '단체복 문의',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Checkbox(
                    activeColor: blackColor,
                    checkColor: whiteColor,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return blackColor.withOpacity(.32);
                      }
                      return blackColor;
                    }),
                    value: _checkUniform,
                    onChanged: (bool? value) {
                      if (_checkSponsorship == true ||
                          _checkCoperation == true) {
                        setState(() {
                          _checkSponsorship = false;
                          _checkCoperation = false;
                          _checkUniform = value!;
                        });
                      } else {
                        setState(() {
                          _checkUniform = value!;
                        });
                      }
                      print('단체복 문의 : $value');
                    },
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: widgetSize(context),
            height: c1BoxSize(context) + 200,
            padding: EdgeInsets.only(top: 20),
            child: TextField(
              controller: _inputInquiry,
              cursorColor: blackColor,
              maxLines: 18,
              keyboardType: TextInputType.multiline,
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
                hintStyle: TextStyle(
                  color: blackColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              width: widgetSize(context),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: blackColor,
                    checkColor: whiteColor,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return blackColor.withOpacity(.32);
                      }
                      return blackColor;
                    }),
                    value: _checkPrivacy,
                    onChanged: (bool? value) {
                      if (_checkPrivacy == false) {
                        setState(() {
                          _checkPrivacy = true;
                        });
                      } else {
                        setState(() {
                          _checkPrivacy = false;
                        });
                      }
                    },
                  ),
                  Text(
                    '개인정보 수집 및 이용 동의',
                    style: TextStyle(
                      fontSize: 16,
                      color: blackColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PrivacyDialog();
                        },
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                if (_checkPrivacy == true) {
                  goInquiry();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Center(child: Text('개인정보 수집에 동의해주세요.')),
                    backgroundColor: bykakColor,
                  ));
                }
              },
              child: Container(
                width: 360,
                height: 56,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '완료',
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
    );
  }
}
