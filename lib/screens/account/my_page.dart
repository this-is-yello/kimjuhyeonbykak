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
                        onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
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
  var adminNameSearch;
  var adminUserName;
  var adminUserId;
  var adminUserSearch;
  var adminUserGrade;
  var adminUserPhone;
  var adminUserBirth;
  var adminUserGender;

  List adminUserInfo = [];

  adminUser(i) async {
    adminNameSearch = await firestore
        .collection('account')
        .where('name', isEqualTo: _inputSearchName.text)
        .get()
        .then((value) {
      setState(() {
        adminUserName = value.docs[i]['name'];
        adminUserId = value.docs[i]['id'];
        adminUserGrade = value.docs[i]['grade'];
        adminUserPhone = value.docs[i]['phone'];
        adminUserBirth = value.docs[i]['birth'];
        adminUserGender = value.docs[i]['gender'];
        adminUserInfo = [
          adminUserName,
          adminUserId,
          adminUserGrade,
          adminUserPhone,
          adminUserBirth,
          adminUserGender
        ];
      });
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   adminUser();
  // }

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
            padding: const EdgeInsets.only(top: 16),
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: widgetSize(context),
                      height: c6BoxSize(context),
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
                            '[주제] 문의제목 삽입',
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
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        setState(() {
                          _inputSearchName.text = value;
                        });
                        adminUser(i);
                      },
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
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
                  child: adminUserName == null
                      ? Container()
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: adminNameSearch.length,
                          itemBuilder: (context, index) {
                            adminUser(index);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '$adminUserName',
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            fontWeight: FontWeight.bold,
                                            color: blackColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Text(
                                            '$adminUserBirth',
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              color: blackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Text(
                                            '$adminUserGrade',
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
                                        '$adminUserId',
                                        style: TextStyle(
                                          fontSize: h4FontSize(context),
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text(
                                        '$adminUserPhone',
                                        style: TextStyle(
                                          fontSize: h4FontSize(context),
                                          fontWeight: FontWeight.bold,
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
