import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var _inputId = TextEditingController();
  var _inputPassword = TextEditingController();

  logInBtn() async {
    try {
      if (_inputId.text.isEmpty || _inputPassword.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(child: Text('이메일 혹은 비밀번호를 입력하세요.')),
          backgroundColor: bykakColor,
        ));
      } else {
        await auth.signInWithEmailAndPassword(
          email: _inputId.text,
          password: _inputPassword.text,
        );
        Get.rootDelegate.toNamed(Routes.MAIN);
        print('로그인 완료 : ${auth.currentUser?.email}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(child: Text('이메일 혹은 비밀번호를 잘 못 입력하였습니다.')),
        backgroundColor: bykakColor,
      ));
    }
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
            InkWell(
              onTap: () {
                Get.rootDelegate.toNamed(Routes.MAIN);
              },
              child: Container(
                width: 200,
                color: whiteColor,
                child: Image.asset(
                  'assets/images/logos/bykakLogo_w.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: _inputId,
                        style: TextStyle(
                          color: blackColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.go,
                        onSubmitted: (value) => logInBtn(),
                        decoration: InputDecoration(
                          hintText: '이메일',
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
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: 360,
                        child: TextField(
                          controller: _inputPassword,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value) => logInBtn(),
                          obscureText: true,
                          style: TextStyle(
                            color: blackColor,
                          ),
                          decoration: InputDecoration(
                            hintText: '비밀번호',
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
                      width: 360,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.rootDelegate.toNamed(Routes.SIGNUP);
                            },
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                color: blackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              '/',
                              style: TextStyle(
                                color: blackColor,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Text(
                              '이메일, 비밀번호 찾기',
                              style: TextStyle(
                                color: blackColor,
                              ),
                            ),
                            onTap: () {
                              Get.rootDelegate.toNamed(Routes.ACCOUNTINQUIRY);
                            },
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        child: Container(
                          width: 360,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: blackColor,
                          ),
                          child: Center(
                            child: Text(
                              '로그인',
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          logInBtn();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
