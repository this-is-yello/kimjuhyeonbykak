import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:get/get.dart';

import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

class ModifyAccountPage extends StatefulWidget {
  const ModifyAccountPage({super.key});

  @override
  State<ModifyAccountPage> createState() => _ModifyAccountPageState();
}

class _ModifyAccountPageState extends State<ModifyAccountPage> {
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

  searchUser() async {
    currentUserSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    setState(() {
      currentUserGrade = currentUserSearch.get('grade');
      currentUserPhone = currentUserSearch.get('phone');
      currentUserBirth = currentUserSearch.get('birth');
      currentUserGender = currentUserSearch.get('gender');
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

  @override
  void initState() {
    super.initState();
    searchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: 360,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: c3BoxSize(context)),
                  child: Text(
                    '계정정보 변경',
                    style: TextStyle(
                      fontSize: h3FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
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
                      fontWeight: FontWeight.bold,
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 80),
                  child: InkWell(
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.MYPAGE);
                    },
                    child: Container(
                      width: 300,
                      height: 56,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: blackColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
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
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainAppBar(),
            ],
          ),
        ],
      ),
    );
  }
}
