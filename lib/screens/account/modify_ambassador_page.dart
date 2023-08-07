import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'dart:math';

import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class ModifyAmbassadorPage extends StatefulWidget {
  const ModifyAmbassadorPage({super.key});

  @override
  State<ModifyAmbassadorPage> createState() => _ModifyAmbassadorPageState();
}

class _ModifyAmbassadorPageState extends State<ModifyAmbassadorPage> {
  PlatformFile? profilePick;
  String? profilePicName;
  String? profilePicUrl;
  var profilePicByte;
  var currentUserSearch;
  var currentUserAmbassador;
  var profilePicNameNum;

  var _inputModifyName = TextEditingController();
  var _inputModifyIntroduce = TextEditingController();
  var _inputModifyInsta = TextEditingController();
  var _inputModifyBlog = TextEditingController();

  searchUser() async {
    currentUserSearch = await firestore
        .collection('account')
        .doc(auth.currentUser?.email)
        .get();
    setState(() {
      currentUserAmbassador = currentUserSearch.get('ambassador');
      profilePicNameNum = currentUserAmbassador[1];
    });
    _inputModifyName = TextEditingController(
      text: currentUserAmbassador[2],
    );
    _inputModifyIntroduce = TextEditingController(
      text: currentUserAmbassador[3],
    );
    _inputModifyInsta = TextEditingController(
      text: currentUserAmbassador[4],
    );
    _inputModifyBlog = TextEditingController(
      text: currentUserAmbassador[5],
    );
  }

  Future modifyProfilePic() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        profilePicByte = result.files.first.bytes;
        profilePicName = result.files.first.name;
        profilePick = result.files.first;
      });
      print(profilePicName);
    } else {
      profilePicName = currentUserAmbassador[1];
      profilePicUrl = currentUserAmbassador[0];
      print('profile is null so $profilePicUrl');
    }
  }

  Future completeModify() async {
    if (profilePicByte == null) {
      var ambassadorData =
          firestore.collection('account').doc(auth.currentUser?.email).update({
        'ambassador': [
          currentUserAmbassador[0],
          currentUserAmbassador[1],
          _inputModifyName.text,
          _inputModifyIntroduce.text,
          _inputModifyInsta.text,
          _inputModifyBlog.text
        ],
      });
      print('업로드 완료');
    } else {
      Random random = Random();
      int randomNumber = random.nextInt(9999999) + 1;

      print('생성된 랜덤 숫자: $randomNumber');
      final ref = firestorage.ref(
          'ambassadorPic/${auth.currentUser?.email}/${randomNumber}_${profilePicName}');
      ref.putData(profilePicByte);
      print('업로드 중 (5초 정도 소요)');
      Future.delayed(Duration(milliseconds: 5000), () {
        var getUrl = ref.getDownloadURL().then(
          (value) {
            if (value == null) {
              print(value);
            } else {
              profilePicUrl = value;
              var ambassadorData = firestore
                  .collection('account')
                  .doc(auth.currentUser?.email)
                  .update({
                'ambassador': [
                  profilePicUrl,
                  '${profilePicName}_$randomNumber',
                  _inputModifyName.text,
                  _inputModifyIntroduce.text,
                  _inputModifyInsta.text,
                  _inputModifyBlog.text
                ],
              });
              print('업로드 완료');
            }
          },
        );
      });
    }
    Get.rootDelegate.toNamed(Routes.MAIN);
  }

  @override
  void initState() {
    super.initState();
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
                controller: ScrollController(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: c3BoxSize(context)),
                    child: Text(
                      '엠버서더 프로필 편집',
                      style: TextStyle(
                        fontSize: h3FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '프로필 사진',
                              style: TextStyle(
                                fontSize: h4FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                modifyProfilePic();
                              },
                              child: Text(
                                '사진 업로드',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 20),
                          child: Container(
                            width: widgetSize(context),
                            // height: c4BoxSize(context),
                            child: Text(
                              profilePicByte == null
                                  ? currentUserAmbassador[1]
                                  : profilePicName,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: h5FontSize(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: SizedBox(
                      width: 360,
                      child: TextField(
                        controller: _inputModifyName,
                        decoration: InputDecoration(
                          hintText: '엠버서더 이름',
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
                      controller: _inputModifyInsta,
                      decoration: InputDecoration(
                        hintText: '인스타그램 링크',
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
                      controller: _inputModifyBlog,
                      decoration: InputDecoration(
                        hintText: '블로그 링크',
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
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      width: 360,
                      child: TextField(
                        controller: _inputModifyIntroduce,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: '엠버서더 소개',
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
                    padding: EdgeInsets.only(top: 20, bottom: 80),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {
                              completeModify();
                            },
                            child: Container(
                              height: 56,
                              child: Center(
                                child: Text(
                                  '완료',
                                  style: TextStyle(
                                    fontSize: h4FontSize(context),
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: blackColor, width: 2),
                                color: blackColor,
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
                                Get.rootDelegate.toNamed(Routes.MYPAGE);
                              },
                              child: Container(
                                height: 56,
                                child: Center(
                                  child: Text(
                                    '취소',
                                    style: TextStyle(
                                      fontSize: h4FontSize(context),
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: blackColor, width: 2),
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
