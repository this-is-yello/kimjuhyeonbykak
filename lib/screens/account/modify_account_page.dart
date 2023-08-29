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
    print(currentUserGender);
    if (currentUserGender == '남자') {
      male = true;
      female = false;
      none = false;
    } else if (currentUserGender == '여자') {
      male = false;
      female = true;
      none = false;
    } else {
      male = false;
      female = false;
      none = true;
    }
    genderModify = [male, female, none];
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
          content: Center(child: Text('입력하지 않은 정보가 있습니다.')),
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
          'gender': _genderState == null ? currentUserGender : _genderState,
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
  }

  @override
  Widget build(BuildContext context) {
    try {
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
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      width: 360,
                      child: Row(
                        children: [
                          Text(
                            '이메일 : ',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                          ),
                          Text(
                            '$currentUserId',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                          ),
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
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: '현재 비밀번호',
                        hintStyle: TextStyle(
                          color: blackColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: 360,
                    child: TextField(
                      controller: _inputModifyPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: '새 비밀번호',
                        hintStyle: TextStyle(
                          color: blackColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
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
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: '새 비밀번호 확인',
                        hintStyle: TextStyle(
                          color: blackColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
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
                        style: TextStyle(
                          fontSize: h4FontSize(context),
                          color: blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '이름',
                          hintStyle: TextStyle(
                            color: blackColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: blackColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: 360,
                    child: TextField(
                      controller: _inputModifyPhone,
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: '전화번호',
                        hintStyle: TextStyle(
                          color: blackColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    width: 360,
                    child: TextField(
                      controller: _inputModifyBirth,
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: '생년월일',
                        hintStyle: TextStyle(
                          color: blackColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    child: ToggleButtons(
                      isSelected: genderModify,
                      constraints: BoxConstraints(minWidth: 117, minHeight: 44),
                      borderWidth: 2,
                      borderColor: blackColor,
                      borderRadius: BorderRadius.circular(4),
                      fillColor: blackColor,
                      color: blackColor,
                      selectedColor: whiteColor,
                      selectedBorderColor: blackColor,
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
                    padding: const EdgeInsets.only(top: 8, bottom: 80),
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
    } catch (e) {
      print(e);
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: whiteColor,
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
