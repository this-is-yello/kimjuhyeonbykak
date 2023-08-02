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
  var currentUserPassword;
  var currentUserPhone;
  var currentUserBirth;
  var currentUserGender;

  var _inputCurrentPassword = TextEditingController();
  var _inputModifyPassword = TextEditingController();
  var _inputModifyPasswordCheck = TextEditingController();
  var _inputmodifyName = TextEditingController();
  var _inputModifyPhone = TextEditingController();
  var _inputModifyBirth = TextEditingController();

  bool male = false;
  bool female = false;
  bool none = false;
  var _genderState;

  late List<bool> genderModify;

  toggleSelect(i) {
    if (i == 0) {
      setState(() {
        male = true;
        female = false;
        none = false;
        _genderState = '남자';
      });
    } else if (i == 1) {
      setState(() {
        male = false;
        female = true;
        none = false;
        _genderState = '여자';
      });
    } else {
      setState(() {
        male = false;
        female = false;
        none = true;
        _genderState = '선택안함';
      });
    }
  }

  searchUser() async {
    currentUserSearch =
        await firestore.collection('account').doc('$currentUserId').get();
    setState(() {
      currentUserPhone = currentUserSearch.get('phone');
      currentUserBirth = currentUserSearch.get('birth');
      currentUserGender = currentUserSearch.get('gender');
      currentUserPassword = currentUserSearch.get('password');
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

  modifyPassword() {
    if (_inputCurrentPassword.text == '' || _inputModifyPassword.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text('정보를 입력하세요.')),
          backgroundColor: bykakColor,
        ),
      );
    } else {
      if (_inputCurrentPassword.text == currentUserPassword) {
        if (_inputModifyPassword.text == _inputModifyPasswordCheck.text) {
          try {
            firestore.collection('account').doc(currentUserId).update({
              'password': _inputModifyPassword.text,
            });
            auth.currentUser
                ?.updatePassword(_inputModifyPassword.text)
                .then((value) => {
                      print('변경완료'),
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(child: Text('비밀번호를 변경하였습니다.')),
                          backgroundColor: bykakColor,
                        ),
                      ),
                      Get.rootDelegate.toNamed(Routes.MAIN),
                    })
                .catchError((error) => {printError()});
          } catch (e) {
            print(e);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.')),
              backgroundColor: bykakColor,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('현재 비밀번호가 틀립니다.')),
            backgroundColor: bykakColor,
          ),
        );
      }
    }
  }

  modifyInfomation() {
    if (_inputmodifyName.text == '' ||
        _inputModifyPhone.text == '' ||
        _inputModifyBirth.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text('입력되지 않은 정보가 있습니다.')),
          backgroundColor: bykakColor,
        ),
      );
    } else {
      try {
        auth.currentUser?.updateDisplayName(_inputmodifyName.text);
        firestore.collection('account').doc(currentUserId).update({
          'name': _inputmodifyName.text,
          'phone': _inputModifyPhone.text,
          'birth': _inputModifyBirth.text,
          'gender': _genderState,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('정보가 변경되었습니다.')),
            backgroundColor: bykakColor,
          ),
        );
        Get.rootDelegate.toNamed(Routes.MAIN);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    inMypage = false;
    searchUser();
    setState(() {
      none = true;
      genderModify = [male, female, none];
    });
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
                    onTap: () {
                      modifyPassword();
                    },
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
                  child: ToggleButtons(
                    isSelected: genderModify,
                    constraints: BoxConstraints(minWidth: 120, minHeight: 44),
                    borderWidth: 0,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    fillColor: blackColor,
                    color: blackColor,
                    selectedColor: whiteColor,
                    onPressed: (index) {
                      toggleSelect(index);
                      setState(() {
                        genderModify = [male, female, none];
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('남자'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('여자'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('선택안함'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      modifyInfomation();
                    },
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
