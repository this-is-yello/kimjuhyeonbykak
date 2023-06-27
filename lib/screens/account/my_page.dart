import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
              const MainAppBar(),
            ],
          ),
        ],
      ),
      floatingActionButton: topState
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: FloatingActionButton(
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: whiteColor,
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

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

var userName = auth.currentUser?.displayName;
var userId = auth.currentUser?.email;
var userSearch;
var userGrade;
var userPhone;
var userBirth;
var userGender;

List infoTitles = [];
List userInfo = [];

class _ProfileState extends State<Profile> {
  searchUser() async {
    userSearch = await firestore
        .collection('account')
        .where('name', isEqualTo: userName)
        .where('id', isEqualTo: userId)
        .get()
        .then((value) {
      setState(() {
        userName = userName;
        userId = userId;
        userGrade = value.docs[0]['grade'];
        userPhone = value.docs[0]['phone'];
        userBirth = value.docs[0]['birth'];
        userGender = value.docs[0]['gender'];
        infoTitles = ['이름', '이메일', '전화번호', '생년월일', '성별'];
        userInfo = [userName, userId, '$userPhone', userBirth, userGender];
      });
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
                  userName.toString(),
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
                  userGrade.toString(),
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
                                  userInfo[index],
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
            child: userGrade == '관리자' ? AdminMyPage() : UserMyPage(),
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
  List memoAdmin = ['매거진 업로드', '보도자료 업로드', '공지사항 업로드', '미디어 업로드', '제품 업로드'];
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
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {},
                          child: Text(
                            '매거진 업로드',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {},
                          child: Text(
                            '보도자료 업로드',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {},
                          child: Text(
                            '공지사항 업로드',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {},
                          child: Text(
                            '이벤트 업로드',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {},
                          child: Text(
                            '미디어 업로드',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {},
                          child: Text(
                            '제품 업로드',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
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
        ],
      ),
    );
  }
}
