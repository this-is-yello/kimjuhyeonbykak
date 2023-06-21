import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:get/get.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
                  'assets/images/logos/bykakLogo_b.png',
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
                        // controller: _inputId,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: '아이디',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: blackColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: 360,
                        child: TextField(
                          // controller: _inputPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '비밀번호',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: blackColor,
                              ),
                              borderRadius: BorderRadius.circular(8),
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
                            child: Text('회원가입'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text('/'),
                          ),
                          InkWell(
                            child: Text('아이디, 비밀번호 찾기'),
                            onTap: () {},
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
                      onTap: () {},
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 24, bottom: 24),
                    //   child: Container(
                    //     width: 360,
                    //     child: Row(
                    //       children: [
                    //         Flexible(
                    //           fit: FlexFit.tight,
                    //           child: Container(
                    //             height: 1,
                    //             color: blackColor,
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.only(left: 16, right: 16),
                    //           child: Text('SNS계정으로 로그인하기'),
                    //         ),
                    //         Flexible(
                    //           fit: FlexFit.tight,
                    //           child: Container(
                    //             height: 1,
                    //             color: blackColor,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: 360,
                    //     height: 56,
                    //     decoration: BoxDecoration(
                    //       color: Colors.yellow,
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         // 카톡 아이콘으로 바꿔야합니다.
                    //         Icon(
                    //           Icons.messenger_sharp,
                    //           color: blackColor,
                    //         ),
                    //         Padding(padding: EdgeInsets.all(16)),
                    //         Text(
                    //           '카카오톡으로 로그인',
                    //           style: TextStyle(
                    //             fontSize: 16,
                    //             color: blackColor,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
