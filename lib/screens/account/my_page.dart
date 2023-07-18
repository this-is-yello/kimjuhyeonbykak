import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:kimjuhyeonbykak/screens/account/board_upload_Modal.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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

  var _inputCurrentPassword;
  var _inputModifyPassword;
  var _inputModifyPasswordCheck;
  var _inputmodifyName;
  var _inputModifyPhone;
  var _inputModifyBirth;

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
      infoTitles = ['이름', '이메일', '전화번호', '생년월일', '성별'];
      currentUserInfo = [
        currentUserName,
        currentUserId,
        currentUserPhone,
        currentUserBirth,
        currentUserGender
      ];
    });
    _inputCurrentPassword = TextEditingController();
    _inputModifyPassword = TextEditingController();
    _inputModifyPasswordCheck = TextEditingController();
    _inputmodifyName = TextEditingController(
      text: auth.currentUser?.displayName,
    );
    _inputModifyPhone = TextEditingController(
      text: currentUserPhone,
    );
    _inputModifyBirth = TextEditingController(
      text: currentUserBirth,
    );
  }

  modifyAc() async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: SizedBox(
          width: 600,
          // height: 800,
          child: Center(
            child: SizedBox(
              width: 360,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    '계정정보 변경',
                    style: TextStyle(
                      fontSize: h3FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: SizedBox(
                      width: 360,
                      child: Row(
                        children: [
                          Text('이메일: '),
                          Text('$currentUserId'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputCurrentPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '현재 비밀번호',
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
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputModifyPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '새 비밀번호',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputModifyPasswordCheck,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '새 비밀번호 확인',
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
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 300,
                        height: 56,
                        decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '비밀번호 변경',
                            style: TextStyle(
                              fontSize: 16,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      '개인정보 변경',
                      style: TextStyle(
                        fontSize: h3FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 360,
                      child: TextField(
                        controller: _inputmodifyName,
                        decoration: InputDecoration(
                          hintText: '이름',
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
                  ),
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputModifyPhone,
                      decoration: InputDecoration(
                        hintText: '전화번호',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputModifyBirth,
                      decoration: InputDecoration(
                        hintText: '생년월일',
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
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 300,
                        height: 56,
                        decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '개인정보 변경',
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
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '닫기',
              style: TextStyle(
                fontSize: 20,
                color: blackColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    searchUser();
  }

  @override
  Widget build(BuildContext context) {
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
                    color: blackColor,
                    fontSize: h1FontSize(context),
                  ),
                ),
                Text(
                  ' 님 안녕하세요!',
                  style: TextStyle(
                    color: blackColor,
                    fontSize: h4FontSize(context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: widgetSize(context),
            child: Row(
              children: [
                Text(
                  '회원님은 바이각의 ',
                  style: TextStyle(
                    color: blackColor,
                    fontSize: h4FontSize(context),
                  ),
                ),
                Text(
                  '$currentUserGrade',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Text(
                  ' 입니다.',
                  style: TextStyle(
                    color: blackColor,
                    fontSize: h4FontSize(context),
                  ),
                ),
              ],
            ),
          ),
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
                          modifyAc();
                        },
                        child: Text(
                          '정보변경',
                          style: TextStyle(
                            color: blackColor,
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
                    child: TextButton(
                      onPressed: () {},
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
                    padding: const EdgeInsets.only(top: 8),
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
            print('본 회원은 엠버서더며, 필드가 존재합니다.');
          } else {
            print('본 회원은 엠버서더며, 필드가 존재하지 않아서 추가합니다.');
            addAmbassador.update({
              'ambassador': [
                'assets/images/default_profile.png',
                auth.currentUser?.displayName,
                '소개합니다.',
                'www.blog.blog',
                'www.insta.inasta',
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

  var currentUserUid = auth.currentUser?.uid;
  var ambassadorPic;
  var ambassadorName;
  var ambassadorIntroduce;
  var ambassadorBlog;
  var ambassadorInsta;

  ambassadorInfo() async {
    var profileStateSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    var snapshot = profileStateSearch.get('ambassador');
    setState(() {
      ambassadorPic = snapshot[0];
      ambassadorName = snapshot[1];
      ambassadorIntroduce = snapshot[2];
      ambassadorBlog = snapshot[3];
      ambassadorInsta = snapshot[4];
    });
    print(ambassadorName);
  }

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
                  '엠버서더 프로필',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: ambassadorName != null
                        ? Container(
                            width: widgetSize(context),
                            child: Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width < 800
                                      ? widgetSize(context)
                                      : widgetSize(context) / 2 - 10,
                                  height: c1BoxSize(context) + 100,
                                  child: Image.asset(
                                    ambassadorPic,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width < 800
                                      ? widgetSize(context)
                                      : widgetSize(context) / 2 - 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            ambassadorName,
                                            style: TextStyle(
                                              fontSize: h2FontSize(context),
                                              fontWeight: FontWeight.bold,
                                              color: blackColor,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              '프로필 편집',
                                              style: TextStyle(
                                                color: blackColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                        ),
                                        child: Text(
                                          ambassadorIntroduce,
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            ambassadorBlog,
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              color: blackColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            ambassadorInsta,
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              color: blackColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            '엠버서더 링크',
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
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
                          )
                        : Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '회원님은 엠버서더가 아닙니다',
                                  style: TextStyle(
                                    fontSize: h5FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '엠버서더 신청',
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
  var searchAdmin;
  var searchAdminLength;

  var communityInquiryLength;
  var communityInquiryDocs;
  var businessInquiryLength;
  var businessInquiryDocs;
  bool? aStste;

  // TextFormField의 텍스트를 지웁니다. ------------------------------
  emptyTextFormField() {
    _inputSearchName.addListener(() {
      _inputSearchName.clear();
    });
  }

  searchItems() async {
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

  inquiryState(i) async {
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
    print(communityInquiryDocs);
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

  @override
  void initState() {
    super.initState();
    searchItems();
    inquiryState(i);
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
          Container(
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
                      runAlignment: WrapAlignment.spaceBetween,
                      alignment: WrapAlignment.spaceBetween,
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                  '회원 관리',
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
                        searchItems();
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
                            searchItems();
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
                                '검색어를 입력하세요.',
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
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: InkWell(
                                  onTap: () {},
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
                                                  fontSize: h4FontSize(context),
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
                                                  fontSize: h4FontSize(context),
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
