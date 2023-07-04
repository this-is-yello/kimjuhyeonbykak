import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

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
  var currentUserSearch;
  var currentUserGrade;

  searchUser() async {
    currentUserSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    setState(() {
      currentUserGrade = currentUserSearch.get('grade');
    });
  }

  var currentUserUid = auth.currentUser?.uid;
  var ambassadorDoc;
  var ambassadorPic;
  var ambassadorName;
  var ambassadorIntroduce;
  var ambassadorBlog;
  var ambassadorInsta;

  ambassadorUser() async {
    var profileStateSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    var snapshot = profileStateSearch.get('ambassador');
    if (currentUserGrade == '엠버서더') {
      await profileStateSearch;
      // await profileStateSearch.doc('ambassador').set({
      //   'photo': 'assets/images/story_bg.jpg',
      //   'nickname': '엠버서더1',
      //   'introduce': '소개합니다.',
      //   'bloglink': 'www.blog.blog',
      //   'instalink': 'www.insta.inasta',
      // });
    }
    setState(() {
      var ambassadorDoc = snapshot.doc;
      ambassadorPic = ambassadorDoc;
      ambassadorName = ambassadorDoc.get('nickname');
      ambassadorIntroduce = ambassadorDoc.get('introduce');
      ambassadorBlog = ambassadorDoc.get('bloglink');
      ambassadorInsta = ambassadorDoc.get('instalink');
    });
  }

  @override
  void initState() {
    super.initState();
    searchUser();
    ambassadorUser();
    print(ambassadorDoc);
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
                  padding: EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: currentUserGrade == '엠버서더'
                        ? Container(
                            width: widgetSize(context),
                            child: Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width < 800
                                      ? widgetSize(context)
                                      : widgetSize(context) / 2 - 10,
                                  child: Image.asset(
                                    ambassadorPic.toString(),
                                    fit: BoxFit.cover,
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
                                      Text(
                                        ambassadorName,
                                        style: TextStyle(
                                          fontSize: h2FontSize(context),
                                          fontWeight: FontWeight.bold,
                                          color: blackColor,
                                        ),
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
                                        child: Text(
                                          ambassadorBlog,
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
                                        child: Text(
                                          ambassadorInsta,
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
                                        child: Text(
                                          '엠버서더 링크',
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            color: blackColor,
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

  var inquiryDataLength;
  var inquiryDataDocs;
  var inquiryDataValue;
  var inquiryDataTitle;
  var inquiryDataDate;
  var inquiryDataDate2;
  var inquiryDataName;
  var inquiryDataMail;
  var inquiryDataPhone;
  var inquiryDataInquiry;

  inquiryData(i) async {
    var inquiryData = await firestore.collection('inquiry').get();
    setState(() {
      inquiryDataDocs = inquiryData.docs;
      inquiryDataLength = inquiryDataDocs.length;
      inquiryDataValue = inquiryDataDocs[i]['value'];
      inquiryDataTitle = inquiryDataDocs[i]['title'];
      inquiryDataDate = inquiryDataDocs[i]['date'];
      inquiryDataName = inquiryDataDocs[i]['name'];
      inquiryDataMail = inquiryDataDocs[i]['mail'];
      inquiryDataPhone = inquiryDataDocs[i]['phone'];
      inquiryDataInquiry = inquiryDataDocs[i]['inquiry'];
    });
    print(inquiryDataDate);
  }

  inquiryAdmin(i) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[${inquiryDataDocs[i]['value']}] ${inquiryDataDocs[i]['title']}',
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
                    inquiryDataDocs[i]['name'],
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      inquiryDataDocs[i]['phone'],
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              inquiryDataDocs[i]['mail'],
              style: TextStyle(
                fontSize: h5FontSize(context),
                color: blackColor,
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: 400,
          // height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    inquiryDataDocs[i]['inquiry'],
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
              onPressed: () {},
              child: Text(
                '전화걸기',
                style: TextStyle(
                  // fontSize: 18,
                  color: blackColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '메일 보내기',
                style: TextStyle(
                  // fontSize: 18,
                  color: blackColor,
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
                  // fontSize: 18,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    searchItems();
    inquiryData(i);
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
          inquiryAdminNum == 0
              ? ListView.builder(
                  itemCount: inquiryDataLength.hashCode,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          inquiryAdmin(index);
                        },
                        child: Container(
                          width: widgetSize(context),
                          padding: EdgeInsets.only(
                            left: 8,
                            top: 20,
                            right: 8,
                            bottom: 20,
                          ),
                          // padding: EdgeInsets.only(bottom: 4),
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
                                '[${inquiryDataDocs[index]['value']}] ${inquiryDataDocs[index]['title']}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                inquiryDataDocs[index]['date'],
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
              : SizedBox(
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                        // suffix: InkWell(
                        //   child: Icon(
                        //     Icons.clear,
                        //     color: greyColor,
                        //   ),
                        //   onTap: () {
                        //     _inputSearchName.clear();
                        //   },
                        // ),
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
                                      Row(
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
                                            padding: EdgeInsets.only(left: 16),
                                            child: Text(
                                              searchAdmin[index]['birth'],
                                              style: TextStyle(
                                                fontSize: h4FontSize(context),
                                                color: blackColor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16),
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
                                      Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text(
                                          searchAdmin[index]['id'],
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8),
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
