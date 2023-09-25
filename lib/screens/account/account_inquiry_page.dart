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
                  darkState
                      ? 'assets/images/logos/bykakTextLogo_w.png'
                      : 'assets/images/logos/bykakTextLogo_b.png',
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
                          decoration: BoxDecoration(
                            border: Border.all(color: blackColor, width: 2),
                            borderRadius: BorderRadius.circular(8),
                            color: searchState ? blackColor : whiteColor,
                          ),
                          child: Center(
                            child: Text(
                              '이메일 찾기',
                              style: TextStyle(
                                fontSize: 16,
                                color: searchState ? whiteColor : blackColor,
                              ),
                            ),
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
                            decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 2),
                              borderRadius: BorderRadius.circular(8),
                              color: searchState ? whiteColor : blackColor,
                            ),
                            child: Center(
                              child: Text(
                                '비밀번호 찾기',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: searchState ? blackColor : whiteColor,
                                ),
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
  final _inputInquiryName = TextEditingController();
  final _inputInquiryBirth = TextEditingController();
  final _inputInquiryPhone = TextEditingController();
  var userSearch;
  var idSearch;

  searchId() async {
    try {
      if (_inputInquiryName.text == '' ||
          _inputInquiryPhone.text == '' ||
          _inputInquiryBirth.text == '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('입력하지 않은 정보가 있습니다.')),
            backgroundColor: bykakColor,
          ),
        );
      } else {
        userSearch = await firestore
            .collection('account')
            .where('name', isEqualTo: _inputInquiryName.text)
            .where('birth', isEqualTo: _inputInquiryBirth.text)
            .where('phone', isEqualTo: _inputInquiryPhone.text)
            .get()
            .then((value) {
          idSearch = value.docs[0]['id'];
        });
        print(idSearch);
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('조회하신 이름으로 등록된 이메일은\n$idSearch 입니다.'),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                            '확인',
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
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text('가입된 정보가 없거나, 잘못된 정보입니다.')),
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
                controller: _inputInquiryBirth,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchId(),
                decoration: InputDecoration(
                  hintText: '생년월일 (예시 : 230606)',
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
                controller: _inputInquiryPhone,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchId(),
                decoration: InputDecoration(
                  hintText: '휴대전화',
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
  final _inputInquiryId = TextEditingController();
  final _inputInquiryName = TextEditingController();
  final _inputInquiryBirth = TextEditingController();
  final _inputInquiryPhone = TextEditingController();
  var userSearch;
  var pwSearch;

  searchPw() async {
    try {
      if (_inputInquiryName.text == '' ||
          _inputInquiryPhone.text == '' ||
          _inputInquiryBirth.text == '' ||
          _inputInquiryId.text == '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('입력하지 않은 정보가 있습니다.')),
            backgroundColor: bykakColor,
          ),
        );
      } else {
        userSearch = await firestore
            .collection('account')
            .where('id', isEqualTo: _inputInquiryId.text)
            .where('name', isEqualTo: _inputInquiryName.text)
            .where('birth', isEqualTo: _inputInquiryBirth.text)
            .where('phone', isEqualTo: _inputInquiryPhone.text)
            .get()
            .then((value) {
          pwSearch = value.docs[0]['password'];
        });
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('조회하신 정보로 등록된 비밀번호는\n$pwSearch 입니다.'),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                            '확인',
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
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text('가입된 정보가 없거나, 잘못된 정보입니다.')),
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
                controller: _inputInquiryId,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchPw(),
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              width: 360,
              child: TextField(
                controller: _inputInquiryName,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchPw(),
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
            Container(
              padding: EdgeInsets.only(bottom: 8),
              width: 360,
              child: TextField(
                controller: _inputInquiryBirth,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => searchPw(),
                decoration: InputDecoration(
                  hintText: '생년월일 (예시 : 230606)',
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
                controller: _inputInquiryPhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '휴대전화',
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
