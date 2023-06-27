import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool male = false;
  bool female = false;
  bool none = false;
  var _genderState;

  late List<bool> genderSelect;

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

  var _inputNewId = TextEditingController();
  var _inputNewPassword = TextEditingController();
  var _inputNewPasswordCheck = TextEditingController();
  var _inputNewName = TextEditingController();
  var _inputNewBirth = TextEditingController();
  var _inputNewPhone = TextEditingController();

  goSignUp() async {
    if (_inputNewId.text.isEmpty ||
        _inputNewPassword.text.isEmpty ||
        _inputNewPasswordCheck.text.isEmpty ||
        _inputNewName.text.isEmpty ||
        _inputNewBirth.text.isEmpty ||
        _inputNewPhone.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(child: Text('입력되지 않은 정보가 있습니다.')),
        backgroundColor: bykakColor,
      ));
    } else {
      try {
        if (_inputNewPassword.text == _inputNewPasswordCheck.text) {
          var signupResult = await auth.createUserWithEmailAndPassword(
            email: _inputNewId.text,
            password: _inputNewPassword.text,
          );
          signupResult.user?.updateDisplayName(_inputNewName.text);
          var signUpData = await firestore.collection('account').doc().set({
            'grade': '각인',
            'name': _inputNewName.text,
            'phone': _inputNewPhone.text,
            'gender': _genderState,
            'id': _inputNewId.text,
            'password': _inputNewPassword.text,
            'birth': _inputNewBirth.text,
          });
          auth.signOut();
          Get.rootDelegate.toNamed(Routes.MAIN);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Center(child: Text('비밀번호가 일치하지 않습니다.')),
            backgroundColor: bykakColor,
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(child: Text('이미 가입되었거나, 가입 불가능한 이메일입니다.')),
          backgroundColor: bykakColor,
        ));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      none = true;
      genderSelect = [male, female, none];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: elevatedBtnTheme,
              onPressed: () {
                Get.rootDelegate.toNamed(Routes.MAIN);
              },
              child: SizedBox(
                width: 200,
                child: Image.asset(
                  'assets/images/logos/bykakTextLogo_b.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputNewId,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: '이메일',
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
                      controller: _inputNewPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '비밀번호',
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
                      controller: _inputNewPasswordCheck,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '비밀번호 확인',
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputNewName,
                      keyboardType: TextInputType.name,
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
                  SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _inputNewBirth,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '생년월일 (예시 : 230606)',
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
                      controller: _inputNewPhone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '휴대전화',
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 360,
                child: ToggleButtons(
                  isSelected: genderSelect,
                  constraints: BoxConstraints(minWidth: 118, minHeight: 40),
                  borderRadius: BorderRadius.circular(8),
                  fillColor: blackColor,
                  color: blackColor,
                  selectedColor: whiteColor,
                  onPressed: (index) {
                    toggleSelect(index);
                    setState(() {
                      genderSelect = [male, female, none];
                    });
                    print(_genderState);
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: InkWell(
                onTap: () {
                  goSignUp();
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
                      '회원가입',
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
    );
  }
}
