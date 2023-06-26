import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:get/get.dart';

class AccountInquiryPage extends StatefulWidget {
  const AccountInquiryPage({super.key});

  @override
  State<AccountInquiryPage> createState() => _AccountInquiryPageState();
}

class _AccountInquiryPageState extends State<AccountInquiryPage> {
  bool searchState = true;

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
              child: SizedBox(
                width: 360,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            searchState = true;
                          });
                        },
                        child: Container(
                          height: 48,
                          child: Center(
                            child: Text(
                              '이메일 찾기',
                              style: TextStyle(
                                fontSize: 16,
                                color: searchState ? whiteColor : blackColor,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: blackColor, width: 2),
                            borderRadius: BorderRadius.circular(8),
                            color: searchState ? blackColor : whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              searchState = false;
                            });
                          },
                          child: Container(
                            height: 48,
                            child: Center(
                              child: Text(
                                '비밀번호 찾기',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: searchState ? blackColor : whiteColor,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 2),
                              borderRadius: BorderRadius.circular(8),
                              color: searchState ? whiteColor : blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            searchState ? IdInquiry() : PwInquiry(),
          ],
        ),
      ),
    );
  }
}

// ---------- ID_Inquiry -----------------------------------------------------------------------------------------------------
class IdInquiry extends StatefulWidget {
  const IdInquiry({super.key});

  @override
  State<IdInquiry> createState() => _IdInquiryState();
}

class _IdInquiryState extends State<IdInquiry> {
  var _inputInquiryName = TextEditingController();
  var _inputInquiryPhone = TextEditingController();

  searchId() async {
    try {
      if (_inputInquiryName.text.isEmpty || _inputInquiryPhone.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('입력되지 않은 정보가 있습니다.')),
            backgroundColor: bykakColor,
          ),
        );
      } else {
        var nameSearch = await firestore
            .collection('account')
            .doc('${_inputInquiryName.text}, ${_inputInquiryPhone.text}')
            .get();
        var idSearch = nameSearch.get('id');
        print(idSearch);
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: Text('조회하신 이름으로 등록된 이메일는\n$idSearch 입니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '확인',
                  style: TextStyle(
                    color: blackColor,
                  ),
                ),
              )
            ],
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('가입된 정보가 없습니다.'),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: InkWell(
                  onTap: () {
                    Get.rootDelegate.toNamed(Routes.SIGNUP);
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
          backgroundColor: bykakColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: SizedBox(
        width: 360,
        child: Column(
          children: [
            SizedBox(
              width: 360,
              child: TextField(
                controller: _inputInquiryName,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchId(),
                decoration: InputDecoration(
                  hintText: '이름',
                  border: const OutlineInputBorder(
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
                    borderRadius: const BorderRadius.only(
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
                controller: _inputInquiryPhone,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchId(),
                decoration: InputDecoration(
                  hintText: '휴대전화',
                  border: const OutlineInputBorder(
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
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: InkWell(
                onTap: () async {
                  searchId();
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
                      '이메일 조회',
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

// ---------- Password_Inquiry -----------------------------------------------------------------------------------------------------
class PwInquiry extends StatefulWidget {
  const PwInquiry({super.key});

  @override
  State<PwInquiry> createState() => _PwInquiryState();
}

class _PwInquiryState extends State<PwInquiry> {
  var _inputInquiryId = TextEditingController();
  var _inputInquiryName = TextEditingController();
  var _inputInquiryPhone = TextEditingController();

  searchPw() async {
    if (_inputInquiryName.text.isEmpty ||
        _inputInquiryPhone.text.isEmpty ||
        _inputInquiryId.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text('입력되지 않은 정보가 있습니다.')),
          backgroundColor: bykakColor,
        ),
      );
    } else {
      try {
        var nameSearch = await firestore
            .collection('account')
            .doc('${_inputInquiryName.text}, ${_inputInquiryPhone.text}')
            .get();
        var idSearch = nameSearch.get('id');
        var pwSearch = nameSearch.get('password');
        if (_inputInquiryId.text == idSearch) {
          print(pwSearch);
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text('조회하신 이메일로 등록된 비밀번호는\n$pwSearch 입니다.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '확인',
                    style: TextStyle(
                      color: blackColor,
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text('입력하신 이메일가 정확하지 않습니다.')),
              backgroundColor: bykakColor,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('가입된 정보가 없습니다.'),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.SIGNUP);
                    },
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: bykakColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: SizedBox(
        width: 360,
        child: Column(
          children: [
            SizedBox(
              width: 360,
              child: TextField(
                controller: _inputInquiryId,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchPw(),
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
                controller: _inputInquiryName,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchPw(),
                decoration: InputDecoration(
                  hintText: '이름',
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
                controller: _inputInquiryPhone,
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
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: InkWell(
                onTap: () async {
                  searchPw();
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
                      '비밀번호 조회',
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
