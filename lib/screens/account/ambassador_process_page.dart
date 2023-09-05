import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:url_launcher/url_launcher.dart';

class AmbassadorProcessPage extends StatefulWidget {
  const AmbassadorProcessPage({super.key});

  @override
  State<AmbassadorProcessPage> createState() => _AmbassadorProcessPageState();
}

class _AmbassadorProcessPageState extends State<AmbassadorProcessPage> {
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
      MediaQuery.of(context).size.height * 0,
      duration: const Duration(milliseconds: 1800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    inMypage = false;
    topState = true;
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
            shrinkWrap: true,
            children: [
              AmbassadorProcessContent(),
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
    );
  }
}

class AmbassadorProcessContent extends StatelessWidget {
  const AmbassadorProcessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widgetSize(context),
        padding: EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                'Process',
                style: TextStyle(
                  fontSize: h2FontSize(context),
                  fontFamily: 'NotoSerif',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: widgetSize(context),
                  child: Text(
                    '● 김주현바이각 엠버서더 관리는 데시그너에서 진행하고 있습니다.',
                    style: TextStyle(
                      fontSize: h4FontSize(context) + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: widgetSize(context),
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    '  - 아래 절차를 숙지하시고 엠버서더 신청을 진행하세요.',
                    style: TextStyle(
                      fontSize: h5FontSize(context) + 2,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 120),
              child: Column(
                children: [
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      '1. 약관 동의 후 회원가입을 진행합니다.',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '  - 엠버서더 코드는 아이디와 동일하게 설정됩니다. (입력X)',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: fadeImage('assets/images/ambassador_process_1.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                children: [
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      '2. 데시그너의 가입정보를 입력합니다.',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      '  - 공식 홈페이지로 돌아와서 데시그너 회원가입 확인을 해야합니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '  - 데시그너에서 가입한 아이디와 이름을 입력합니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: fadeImage('assets/images/ambassador_process_2.png'),
                  ),
                ],
              ),
            ),
            Container(
              width: widgetSize(context),
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                '3. 데시그너에 로그인 후 엠버서더 메뉴로 진입합니다.',
                style: TextStyle(
                  fontSize: h4FontSize(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: widgetSize(context),
              child: Text(
                '  - 회원가입 확인이 완료되면 엠버서더 메뉴가 활성화 됩니다.',
                style: TextStyle(
                  fontSize: h5FontSize(context),
                ),
              ),
            ),
            SizedBox(
              width: widgetSize(context),
              child: fadeImage('assets/images/ambassador_process_3.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 120),
              child: Column(
                children: [
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      '4. 신청서를 작성 제출 후, 승인이 될 때까지 기다립니다. ',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      '  - 기업 파트너일 경우 : 사업자등록증(기업) 사본',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '  - 개인 파트너일 경우 : 신분증(기업) 사본',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: fadeImage('assets/images/ambassador_process_4.png'),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return WillPopScope(
                      onWillPop: () async => false,
                      child: DesignerAmbassador(),
                    );
                  },
                );
                final url = Uri.parse(
                  'http://xn--2i0b31d0uch0z.com/bbs/register.php',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
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
                    '엠버서더 신청하기',
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
      ),
    );
  }
}

class DesignerAmbassador extends StatefulWidget {
  const DesignerAmbassador({super.key});

  @override
  State<DesignerAmbassador> createState() => _DesignerAmbassadorState();
}

class _DesignerAmbassadorState extends State<DesignerAmbassador> {
  var _inputDesignerName = TextEditingController();
  var _inputDesignerPhone = TextEditingController();
  var _inputDesignerId = TextEditingController();

  var currentUserId = auth.currentUser?.email;

  changeGrade() async {
    var currentUserGrade =
        await firestore.collection('account').doc('$currentUserId').update({
      'grade': '엠버서더 대기중',
      'ambassadorReady': [_inputDesignerName.text, _inputDesignerId.text],
    });
  }

  noMemberAmbassador() async {
    var noMember = await firestore
        .collection('noMemberAmbassador')
        .doc(_inputDesignerId.text)
        .set({
      'name': _inputDesignerName.text,
      'phone': _inputDesignerPhone.text,
      'id': _inputDesignerId.text,
      'grade': '엠버서더 대기중',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Container(
          width: 360,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                '데시그너 가입 확인',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              Container(
                width: 360,
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _inputDesignerName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: '데시그너 가입 이름',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: blackColor,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 360,
                child: TextField(
                  controller: _inputDesignerPhone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '전화번호',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: blackColor,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: 360,
                  child: TextField(
                    controller: _inputDesignerId,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: '데시그너 아이디',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: blackColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 360,
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          // 신청데이터 수집
                          if (_inputDesignerId.text != '' &&
                              _inputDesignerName.text != '') {
                            if (auth.currentUser?.uid != null) {
                              print('공홈 "회원"이 엠버서더를 신청합니다.');
                              changeGrade();
                            } else {
                              print('공홈 "비회원"이 엠버서더를 신청합니다.');
                              noMemberAmbassador();
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                                  child: Text('정보 전달 완료. 확인까지 최대 24시간 걸립니다.')),
                              backgroundColor: bykakColor,
                            ));
                            Navigator.pop(context);
                            Get.rootDelegate.toNamed(Routes.BUSINESS);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(child: Text('정보를 입력하세요.')),
                              backgroundColor: bykakColor,
                            ));
                          }
                        },
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: blackColor,
                          ),
                          child: Center(
                            child: Text(
                              '확인요청',
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                              ),
                            ),
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
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 2),
                              borderRadius: BorderRadius.circular(8),
                              color: whiteColor,
                            ),
                            child: Center(
                              child: Text(
                                '취소',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: blackColor,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
