import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/screens/account/ambassador_process_page.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:kimjuhyeonbykak/screens/account/board_upload_modal.dart';

import 'package:image_fade/image_fade.dart';
// import 'package:file_picker/file_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
    inMypage = true;
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
            children: [
              Profile(),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                ),
                child: Footer(),
              ),
              bottomToTop(context, () => moveTop()),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainAppBar(),
            ],
          ),
        ],
      ),
      floatingActionButton: topState
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: FloatingActionButton(
                onPressed: () {
                  moveTop();
                },
                backgroundColor: bykakColor,
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: whiteColor,
                  size: 30,
                ),
              ),
            ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var currentUserName = auth.currentUser?.displayName;
  var currentUserId = auth.currentUser?.email;
  var currentUserSearch;
  var currentUserGrade;
  var currentUserPhone;
  var currentUserBirth;
  var currentUserGender;

  List infoTitles = [];
  List currentUserInfo = [];
  searchUser() async {
    currentUserSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    setState(() {
      currentUserGrade = currentUserSearch.get('grade');
      currentUserPhone = currentUserSearch.get('phone');
      currentUserBirth = currentUserSearch.get('birth');
      currentUserGender = currentUserSearch.get('gender');
      infoTitles = ['이름', '이메일', '회원등급', '전화번호', '생년월일', '성별'];
      currentUserInfo = [
        currentUserName,
        currentUserId,
        currentUserGrade,
        currentUserPhone,
        currentUserBirth,
        currentUserGender
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    searchUser();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserGrade != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Column(
          children: [
            SizedBox(
              width: widgetSize(context),
              child: Row(
                children: [
                  Text(
                    currentUserName.toString(),
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    ' 님 안녕하세요!',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: widgetSize(context),
            //   child: Row(
            //     children: [
            //       Text(
            //         '회원님은 바이각의 ',
            //         style: TextStyle(
            //           fontSize: h4FontSize(context),
            //           color: blackColor,
            //         ),
            //       ),
            //       Text(
            //         '$currentUserGrade',
            //         style: TextStyle(
            //           fontSize: h3FontSize(context),
            //           fontWeight: FontWeight.bold,
            //           color: blackColor,
            //         ),
            //       ),
            //       Text(
            //         ' 입니다.',
            //         style: TextStyle(
            //           color: blackColor,
            //           fontSize: h4FontSize(context),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                width: widgetSize(context),
                height: 3,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '내 정보',
                          style: TextStyle(
                            fontSize: h2FontSize(context),
                            color: blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.rootDelegate.toNamed(Routes.MODIFYACCOUNT);
                          },
                          child: Text(
                            '정보변경',
                            style: TextStyle(
                              color: blackColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: infoTitles.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  infoTitles[index],
                                  style: TextStyle(
                                    fontSize: h4FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    currentUserInfo[index],
                                    style: TextStyle(
                                      fontSize: h4FontSize(context),
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
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
                          '마일리지 조회 및 신청 >',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        width: widgetSize(context),
                        height: 2,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: currentUserGrade == '관리자' ? AdminMyPage() : UserMyPage(),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: widgetSize(context),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: blackColor),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '로딩이 오래 걸리면 새로고침(F5) 한 번만 눌러주세요.',
                  style: TextStyle(color: blackColor),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

// ---------- User_My_Page -----------------------------------------------------------------------------------------------------
class UserMyPage extends StatefulWidget {
  const UserMyPage({super.key});

  @override
  State<UserMyPage> createState() => _UserMyPageState();
}

class _UserMyPageState extends State<UserMyPage> {
  var currentUserId = auth.currentUser?.email;
  var currentUserGrade;

  // ------------------------------ Search_Ambassador ------------------------------
  currentUser() async {
    var currentUserSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    setState(() {
      currentUserGrade = currentUserSearch.get('grade');
    });
    currentUserSearch.data()!.containsKey('ambassador');
    var addAmbassador =
        await firestore.collection('account').doc('$currentUserId');
    addAmbassador.get().then((DocumentSnapshot doc) {
      if (doc.exists) {
        if (currentUserGrade == '엠버서더') {
          if (currentUserSearch.data()!.containsKey('ambassador')) {
            print('본 회원은 엠버서더이며, 필드가 존재합니다.');
          } else {
            print('본 회원은 엠버서더이며, 필드가 존재하지 않으므로 추가합니다.');
            addAmbassador.update({
              'ambassador': [
                auth.currentUser?.displayName,
                '엠버서더 소개말을 추가하세요.',
                '',
                '',
              ]
            });
            print('추가완료');
          }
        } else {
          print('본 회원은 엠버서더가 아닙니다.');
        }
      } else {
        print('문서가 존재하지 않습니다.');
      }
    });
  }

  var ambassadorId;
  var ambassadorName;

  ambassadorInfo() async {
    var profileStateSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    var snapshot = profileStateSearch.get('ambassador');
    setState(() {
      ambassadorName = snapshot[0];
      ambassadorId = snapshot[1];
    });
    print(ambassadorName);
  }

  // ------------------------------ Modify_Ambassador_Profile ------------------------------
  @override
  void initState() {
    super.initState();
    currentUser();
    ambassadorInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '엠버서더',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: currentUserGrade == '엠버서더'
                        ? Column(
                            children: [
                              Container(
                                width: widgetSize(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                '엠버서더 이름',
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Text(
                                                  ambassadorName,
                                                  style: TextStyle(
                                                    fontSize:
                                                        h4FontSize(context),
                                                    color: blackColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '엠버서더 아이디',
                                              style: TextStyle(
                                                fontSize: h4FontSize(context),
                                                fontWeight: FontWeight.bold,
                                                color: blackColor,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16),
                                              child: Text(
                                                ambassadorId,
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  color: blackColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        final url = Uri.parse(
                                          'http://xn--2i0b31d0uch0z.com/shop/partner/login.php',
                                        );
                                        if (await canLaunchUrl(url)) {
                                          launchUrl(
                                            url,
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        }
                                      },
                                      child: Text(
                                        '엠버서더 페이지',
                                        style: TextStyle(
                                          fontSize: h5FontSize(context),
                                          color: blackColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: SizedBox(
                                      width: widgetSize(context),
                                      child: Text(
                                        '엠버서더 활동',
                                        style: TextStyle(
                                          fontSize: h4FontSize(context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      runAlignment: WrapAlignment.spaceBetween,
                                      alignment: WrapAlignment.start,
                                      spacing: 10,
                                      runSpacing: 30,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  800
                                              ? widgetSize(context)
                                              : (widgetSize(context) / 3) - 7,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '1. 컨텐츠 제작',
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  '인스타그램, 유튜브 등에 게시될 사진,\n영상을 직접 제작하며 제품을 홍보',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        h5FontSize(context) + 2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  800
                                              ? widgetSize(context)
                                              : (widgetSize(context) / 3) - 7,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '2. 유저 유입과 구입',
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  '컨텐츠를 접한 유저들이 직접\n인플루언서 추천코드로 아이템을 구매',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        h5FontSize(context) + 2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  800
                                              ? widgetSize(context)
                                              : (widgetSize(context) / 3) - 7,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '3. 수수료 정산',
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  '구매확정이 완료되면, 판매 성과를\n기반으로 계약된 수수료 지급',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        h5FontSize(context) + 2,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '엠버서더 혜택',
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: SizedBox(
                                            width: widgetSize(context),
                                            child: fadeImage(
                                                'assets/images/benefit.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : currentUserGrade == '엠버서더 대기중'
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Text(
                                    '전송된 엠버서더 계정이 확인될 때까지 기다려주세요.\n(확인까지 최대 24시간 걸립니다.)',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h4FontSize(context),
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 2),
                                            child: Text(
                                              '회원님은 엠버서더가 아닙니다.',
                                              style: TextStyle(
                                                fontSize: h4FontSize(context),
                                                color: blackColor,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Get.rootDelegate.toNamed(
                                                  Routes.AMBASSADORPROCESS);
                                            },
                                            child: Text(
                                              '엠버서더 신청',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: h4FontSize(context),
                                                color: blackColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 2),
                                          child: Text(
                                            '이미 엠버서더라면?',
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              color: blackColor,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DesignerAmbassador();
                                              },
                                            );
                                          },
                                          child: Text(
                                            '엠버서더 정보입력',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: h4FontSize(context),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Admin_My_Page -----------------------------------------------------------------------------------------------------
class AdminMyPage extends StatefulWidget {
  const AdminMyPage({super.key});

  @override
  State<AdminMyPage> createState() => _AdminMyPageState();
}

class _AdminMyPageState extends State<AdminMyPage> {
  var _inputSearchName = TextEditingController();
  var _inputNonMembarName = TextEditingController();
  var searchAdmin;
  var adminLength;
  var searchAdminLength;
  var searchNonMember;
  var nonMemberLength;
  var searchNonMemberLength;

  var communityInquiryLength;
  var communityInquiryDocs;
  var businessInquiryLength;
  var businessInquiryDocs;
  bool? aStste;

  // TextFormField의 텍스트를 지웁니다. ------------------------------
  // emptyTextFormField() {
  //   _inputSearchName.addListener(() {
  //     _inputSearchName.clear();
  //   });
  // }

  searchUsers() async {
    var lengthResult = await firestore.collection('account').get();
    adminLength = lengthResult.docs.length;
    Map<String, dynamic> searchResult = await firestore
        .collection('account')
        .where('name', isEqualTo: _inputSearchName.text)
        .get()
        .then((value) {
      setState(() {
        searchAdmin = value.docs;
        searchAdminLength = value.docs.length;
      });
      return Future.delayed(Duration.zero);
    });
  }

  searchNoMember() async {
    var lengthResult = await firestore.collection('noMemberAmbassador').get();
    nonMemberLength = lengthResult.docs.length;
    Map<String, dynamic> searchResult = await firestore
        .collection('noMemberAmbassador')
        .where('name', isEqualTo: _inputNonMembarName.text)
        .get()
        .then((value) {
      setState(() {
        searchNonMember = value.docs;
        searchNonMemberLength = value.docs.length;
      });
      return Future.delayed(Duration.zero);
    });
  }

  inquiryState() async {
    var communityInquiry = await firestore
        .collection('communityInquiry')
        .orderBy('date', descending: true)
        .get();
    var businessInquiry = await firestore
        .collection('businessInquiry')
        .orderBy('date', descending: true)
        .get();
    setState(() {
      communityInquiryDocs = communityInquiry.docs;
      communityInquiryLength = communityInquiry.docs.length;
      businessInquiryDocs = businessInquiry.docs;
      businessInquiryLength = businessInquiry.docs.length;
    });
  }

  // 고객문의 다이얼로그 ------------------------------
  inquiryCommunity(i) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[${communityInquiryDocs[i]['value']}] ${communityInquiryDocs[i]['title']}',
              style: TextStyle(
                fontSize: h3FontSize(context),
                color: blackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    communityInquiryDocs[i]['name'],
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        communityInquiryDocs[i]['phone'],
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          decoration: TextDecoration.underline,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '이메일',
                  style: TextStyle(
                    fontSize: h5FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      communityInquiryDocs[i]['mail'],
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        decoration: TextDecoration.underline,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        content: SizedBox(
          width: 400,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    communityInquiryDocs[i]['inquiry'],
                    style: TextStyle(
                      height: 1.5,
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                try {
                  if (communityInquiryDocs[i]['aState'] == '답변 대기중') {
                    firestore
                        .collection('communityInquiry')
                        .doc(communityInquiryDocs[i]['date'])
                        .update({
                      'aState': '답변완료',
                    });
                  } else if (communityInquiryDocs[i]['aState'] == '답변완료') {
                    firestore
                        .collection('communityInquiry')
                        .doc(communityInquiryDocs[i]['date'])
                        .update({
                      'aState': '답변 대기중',
                    });
                  }
                  inquiryState();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Center(
                      child: Text('답변 상태를 변경하였습니다.'),
                    ),
                    backgroundColor: bykakColor,
                  ));
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                communityInquiryDocs[i]['aState'],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '닫기',
                style: TextStyle(
                  fontSize: 18,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 비즈니스 문의 다이얼로그 ------------------------------
  inquiryBusiness(i) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[${businessInquiryDocs[i]['value']}] ${businessInquiryDocs[i]['title']}',
              style: TextStyle(
                fontSize: h3FontSize(context),
                color: blackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    businessInquiryDocs[i]['company'],
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        businessInquiryDocs[i]['phone'],
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          decoration: TextDecoration.underline,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '이메일',
                  style: TextStyle(
                    fontSize: h5FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      businessInquiryDocs[i]['mail'],
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        decoration: TextDecoration.underline,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    '홈페이지',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        businessInquiryDocs[i]['web'],
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          decoration: TextDecoration.underline,
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
        content: SizedBox(
          width: 400,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    businessInquiryDocs[i]['inquiry'],
                    style: TextStyle(
                      height: 1.5,
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                try {
                  if (businessInquiryDocs[i]['aState'] == '답변 대기중') {
                    firestore
                        .collection('businessInquiry')
                        .doc(businessInquiryDocs[i]['date'])
                        .update({
                      'aState': '답변완료',
                    });
                  } else if (businessInquiryDocs[i]['aState'] == '답변완료') {
                    firestore
                        .collection('businessInquiry')
                        .doc(businessInquiryDocs[i]['date'])
                        .update({
                      'aState': '답변 대기중',
                    });
                  }
                  inquiryState();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Center(
                      child: Text('답변 상태를 변경하였습니다.'),
                    ),
                    backgroundColor: bykakColor,
                  ));
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                businessInquiryDocs[i]['aState'],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '닫기',
                style: TextStyle(
                  fontSize: 18,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double plusIndex = 0;
  int pageNum = 0;

  // ListView의 itemCount를 변경합니다. ------------------------------
  listCount() {
    // 고객 문의 일 때
    if (inquiryAdminNum == 0) {
      if (communityInquiryLength.hashCode > 5) {
        if (plusIndex < communityInquiryLength.hashCode - 5) {
          // 첫 페이지
          return 5;
        } else {
          // 다음 페이지
          return communityInquiryLength.hashCode % 5;
        }
      } else if (communityInquiryLength.hashCode <= 5) {
        return communityInquiryLength.hashCode;
      }
    }
    // 비즈니스 문의 일 때
    else if (inquiryAdminNum == 1) {
      if (businessInquiryLength.hashCode > 5) {
        if (plusIndex < businessInquiryLength.hashCode - 5) {
          // 첫 페이지
          return 5;
        } else {
          // 다음 페이지
          return businessInquiryLength.hashCode % 5;
        }
      } else if (businessInquiryLength.hashCode <= 5) {
        return businessInquiryLength.hashCode;
      }
    }
  }

  bool _checkAdmin = false;
  bool _checkAmbassador = false;
  bool _checkKakin = false;

  userInfo(index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '회원정보',
            style: TextStyle(
              fontSize: h3FontSize(context),
              color: blackColor,
            ),
          ),
          content: SizedBox(
            width: 320,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Text(
                        '${searchAdmin[index]['name']}  /  ${searchAdmin[index]['birth']}  /  ${searchAdmin[index]['gender']}',
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '전화번호',
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4,
                        ),
                        child: TextButton(
                          onPressed: () async {
                            final url = Uri.parse(
                              'tel:${searchAdmin[index]['phone']}',
                            );
                            if (await canLaunchUrl(url)) {
                              launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: Text(
                            searchAdmin[index]['phone'],
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              decoration: TextDecoration.underline,
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '이메일',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: TextButton(
                        onPressed: () async {
                          final url = Uri.parse(
                            'mailto:${searchAdmin[index]['id']}',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Text(
                          searchAdmin[index]['id'],
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            decoration: TextDecoration.underline,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '등급',
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text(
                          searchAdmin[index]['grade'],
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            color: bykakColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    gradeDialog(index);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(320, 40),
                    backgroundColor: blackColor,
                  ),
                  child: Text(
                    '등급변경',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: blackColor, width: 2),
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Text(
                          '닫기',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  gradeState(index) {
    if (searchAdmin[index]['grade'] == '관리자') {
      setState(() {
        _checkAdmin = true;
        _checkAmbassador = false;
        _checkKakin = false;
      });
    } else if (searchAdmin[index]['grade'] == '엠버서더') {
      setState(() {
        _checkAdmin = false;
        _checkAmbassador = true;
        _checkKakin = false;
      });
    } else {
      _checkAdmin = false;
      _checkAmbassador = false;
      _checkKakin = true;
    }
  }

  gradeDialog(index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '등급변경',
            style: TextStyle(
              fontSize: h3FontSize(context),
              color: blackColor,
            ),
          ),
          content: SizedBox(
            width: 320,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '관리자',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: blackColor,
                      ),
                    ),
                    Checkbox(
                      activeColor: blackColor,
                      checkColor: whiteColor,
                      value: _checkAdmin,
                      onChanged: (bool? value) {
                        if (_checkAmbassador == true || _checkKakin == true) {
                          setState(() {
                            _checkAmbassador = false;
                            _checkKakin = false;
                            _checkAdmin = value!;
                          });
                        } else {
                          setState(() {
                            _checkAdmin = value!;
                          });
                        }
                        try {
                          firestore
                              .collection('account')
                              .doc(searchAdmin[index]['id'])
                              .update({
                            'grade': '관리자',
                          });
                          searchUsers();
                        } catch (e) {
                          print(e);
                        }
                        Navigator.pop(context);
                        print('관리자');
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '엠버서더',
                        style: TextStyle(
                          fontSize: h6FontSize(context),
                          color: blackColor,
                        ),
                      ),
                      Checkbox(
                        activeColor: blackColor,
                        checkColor: whiteColor,
                        value: _checkAmbassador,
                        onChanged: (bool? value) {
                          if (_checkAdmin == true || _checkKakin == true) {
                            setState(() {
                              _checkAdmin = false;
                              _checkKakin = false;
                              _checkAmbassador = value!;
                            });
                          } else {
                            setState(() {
                              _checkAmbassador = value!;
                            });
                          }
                          try {
                            firestore
                                .collection('account')
                                .doc(searchAdmin[index]['id'])
                                .update({
                              'grade': '엠버서더',
                            });
                            searchUsers();
                          } catch (e) {
                            print(e);
                          }
                          Navigator.pop(context);
                          print('엠버서더');
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '각인',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: blackColor,
                      ),
                    ),
                    Checkbox(
                      activeColor: blackColor,
                      checkColor: whiteColor,
                      value: _checkKakin,
                      onChanged: (bool? value) {
                        if (_checkAdmin == true || _checkAmbassador == true) {
                          setState(() {
                            _checkAdmin = false;
                            _checkAmbassador = false;
                            _checkKakin = value!;
                          });
                        } else {
                          setState(() {
                            _checkKakin = value!;
                          });
                        }
                        try {
                          firestore
                              .collection('account')
                              .doc(searchAdmin[index]['id'])
                              .update({
                            'grade': '각인',
                          });
                          searchUsers();
                        } catch (e) {
                          print(e);
                        }
                        Navigator.pop(context);
                        print('각인');
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      child: Center(
                        child: Text(
                          '닫기',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: whiteColor,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: blackColor, width: 2),
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  nonGradeDialog(index) {
    bool a = false;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '등급변경',
            style: TextStyle(
              fontSize: h3FontSize(context),
              color: blackColor,
            ),
          ),
          content: SizedBox(
            width: 320,
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    if (searchNonMember[index]['grade'] == '엠버서더 대기중') {
                      try {
                        firestore
                            .collection('noMemberAmbassador')
                            .doc(searchNonMember[index]['id'])
                            .update({
                          'grade': '엠버서더',
                        });
                        setState(() {
                          a = true;
                        });
                        searchNoMember();
                      } catch (e) {
                        print(e);
                      }
                      Navigator.pop(context);
                    } else {
                      try {
                        firestore
                            .collection('noMemberAmbassador')
                            .doc(searchNonMember[index]['id'])
                            .update({
                          'grade': '엠버서더 대기중',
                        });
                        setState(() {
                          a = false;
                        });
                        searchNoMember();
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '엠버서더 인정 / 박탈',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: InkWell(
                    onTap: () {
                      try {
                        firestore
                            .collection('noMemberAmbassador')
                            .doc(searchNonMember[index]['id'])
                            .delete();
                        searchNoMember();
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '엠버서더 신청 삭제',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        '닫기',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: whiteColor,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: blackColor, width: 2),
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    searchUsers();
    searchNoMember();
    inquiryState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '문의 관리',
            style: TextStyle(
              fontSize: h2FontSize(context),
              color: blackColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
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
                        inquiryAdminNum = 0;
                        plusIndex = 0;
                        pageNum = 0;
                      });
                    },
                    child: Text(
                      '고객 문의',
                      style: TextStyle(
                        fontSize: inquiryAdminNum == 0 ? 14 : 13,
                        fontWeight: inquiryAdminNum == 0
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
                        inquiryAdminNum = 1;
                        plusIndex = 0;
                        pageNum = 0;
                      });
                    },
                    child: Text(
                      '비즈니스 문의',
                      style: TextStyle(
                        fontSize: inquiryAdminNum == 1 ? 14 : 13,
                        fontWeight: inquiryAdminNum == 1
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
          SizedBox(
            height: c4BoxSize(context) * 5,
            child: businessInquiryLength != 0 && communityInquiryLength != 0
                ? ListView.builder(
                    itemCount: listCount(),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: () {
                            inquiryAdminNum == 0
                                ? inquiryCommunity(index + plusIndex)
                                : inquiryBusiness(index + plusIndex);
                          },
                          child: Container(
                            width: widgetSize(context),
                            height: c4BoxSize(context) - 10,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: greyColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  inquiryAdminNum == 0
                                      ? '[${communityInquiryDocs[index + plusIndex]['value']}] ${communityInquiryDocs[index + plusIndex]['title']}'
                                      : '[${businessInquiryDocs[index + plusIndex]['value']}] ${businessInquiryDocs[index + plusIndex]['title']}',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: h5FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                                Text(
                                  inquiryAdminNum == 0
                                      ? communityInquiryDocs[index + plusIndex]
                                              ['date']
                                          .toString()
                                          .substring(0, 10)
                                      : businessInquiryDocs[index + plusIndex]
                                              ['date']
                                          .toString()
                                          .substring(0, 10),
                                  style: TextStyle(
                                    fontSize: h6FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: SizedBox(
                      width: widgetSize(context),
                      child: Center(
                        child: Text(
                          '답변할 문의정보가 없습니다',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (plusIndex <= 0) {
                      plusIndex = 0;
                      pageNum = 0;
                    } else {
                      setState(() {
                        plusIndex = plusIndex - 5;
                        pageNum--;
                      });
                    }
                    print('${pageNum + 1}페이지');
                  },
                  child: Text(
                    '〈 이전 페이지',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (inquiryAdminNum == 0) {
                      double a1 = communityInquiryLength / 5;
                      int b1 = a1.floor();
                      if (b1 == pageNum) {
                        setState(() {
                          plusIndex = plusIndex + 0;
                          b1 + 1;
                        });
                      } else {
                        setState(() {
                          plusIndex = plusIndex + 5;
                          pageNum++;
                        });
                      }
                      print('${pageNum + 1}페이지');
                    } else if (inquiryAdminNum == 1) {
                      double a2 = businessInquiryLength / 5;
                      int b2 = a2.floor();
                      if (b2 == pageNum) {
                        setState(() {
                          plusIndex = plusIndex + 0;
                          b2 + 1;
                        });
                      } else {
                        setState(() {
                          plusIndex = plusIndex + 5;
                          pageNum++;
                        });
                      }
                      print('${pageNum + 1}페이지');
                    }
                  },
                  child: Text(
                    '다음 페이지 〉',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '게시판 관리',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MagazineUpModal();
                                },
                              );
                            },
                            child: Text(
                              '매거진 업로드',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return NewsUpModal();
                                },
                              );
                            },
                            child: Text(
                              '보도자료 업로드',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return NotificationUpModal();
                                },
                              );
                            },
                            child: Text(
                              '공지사항 업로드',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return EventUpModal();
                                },
                              );
                            },
                            child: Text(
                              '이벤트 업로드',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MediaUpModal();
                                },
                              );
                            },
                            child: Text(
                              '미디어 업로드',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ProductUpModal();
                                },
                              );
                            },
                            child: Text(
                              '제품 업로드',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                                decoration: TextDecoration.underline,
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
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '회원 관리 ($adminLength)',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: TextField(
                      controller: _inputSearchName,
                      cursorColor: blackColor,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        setState(() {
                          _inputSearchName.text = value;
                        });
                        searchUsers();
                      },
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: SizedBox(
                            width: 70,
                            child: Icon(
                              Icons.search,
                              color: blackColor,
                            ),
                          ),
                          onTap: () {
                            searchUsers();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor, width: 2),
                        ),
                        hintText: '이름을 입력하세요.',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: _inputSearchName.text.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: widgetSize(context),
                            child: Center(
                              child: Text(
                                '검색결과 없음',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchAdminLength,
                            itemBuilder: (context, index) {
                              try {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: InkWell(
                                    onTap: () {
                                      gradeState(index);
                                      userInfo(index);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                searchAdmin[index]['name'],
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16),
                                                child: Text(
                                                  searchAdmin[index]['birth'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        h4FontSize(context),
                                                    color: blackColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16),
                                                child: Text(
                                                  searchAdmin[index]['grade'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        h4FontSize(context),
                                                    color: blackColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          searchAdmin[index]['id'],
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            color: blackColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            searchAdmin[index]['phone'],
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              fontWeight: FontWeight.bold,
                                              color: blackColor,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: widgetSize(context),
                                          height: 2,
                                          color: greyColor,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              } catch (e) {
                                return SizedBox(
                                  width: widgetSize(context),
                                  height: 300,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          color: blackColor,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            '로딩이 오래 걸리면 새로고침(F5) 한 번만 눌러주세요.',
                                            style: TextStyle(color: blackColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '비회원 엠버서더 ($nonMemberLength)',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: TextField(
                      controller: _inputNonMembarName,
                      cursorColor: blackColor,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        setState(() {
                          _inputNonMembarName.text = value;
                        });
                        searchNoMember();
                      },
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: SizedBox(
                            width: 70,
                            child: Icon(
                              Icons.search,
                              color: blackColor,
                            ),
                          ),
                          onTap: () {
                            searchNoMember();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor, width: 2),
                        ),
                        hintText: '이름을 입력하세요.',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: _inputNonMembarName.text.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: widgetSize(context),
                            child: Center(
                              child: Text(
                                '검색결과 없음',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchNonMemberLength,
                            itemBuilder: (context, index) {
                              try {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: InkWell(
                                    onTap: () {
                                      // gradeState(index);
                                      // userInfo(index);
                                      nonGradeDialog(index);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                searchNonMember[index]['name'],
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16),
                                                child: Text(
                                                  searchNonMember[index]
                                                      ['grade'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        h4FontSize(context),
                                                    color: blackColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          searchNonMember[index]['id'],
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            color: blackColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            searchNonMember[index]['phone'],
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              fontWeight: FontWeight.bold,
                                              color: blackColor,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: widgetSize(context),
                                          height: 2,
                                          color: greyColor,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              } catch (e) {
                                return SizedBox(
                                  width: widgetSize(context),
                                  height: 300,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                            color: blackColor),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            '로딩이 오래 걸리면 새로고침(F5) 한 번만 눌러주세요.',
                                            style: TextStyle(color: blackColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
