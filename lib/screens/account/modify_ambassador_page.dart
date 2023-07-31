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

  Future modifyProfile() async {
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
      print('profile is null');
    }
  }

  Future uploadProfile() async {
    Random random = Random();
    int randomNumber = random.nextInt(9999999) + 1;

    print('생성된 랜덤 숫자: $randomNumber');
    final ref = firestorage.ref(
        'ambassadorPic/${auth.currentUser?.email}/${profilePicName}_$randomNumber');
    ref.putData(profilePicByte);
    print('업로드 중일겁니다..');
    Future.delayed(
      Duration(milliseconds: 5000),
      () {
        var getUrl = ref.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            profilePicUrl = value;
          }
          if (profilePicUrl != null) {
            var magazineData = firestore.collection('magazine').doc().set({
              'name': auth.currentUser!.displayName,
              'date': DateTime.now().toString(),
              // 'title': _inputMagazineTitle.text,
              // 'thumbnail': thumbnailUrl.toString(),
              // 'content': contentUrl.toString(),
            });
            print('업로드 완료');
          }
        });
      },
    );
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
                              modifyProfile();
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
                            profilePicName == null ? '파일없음' : '$profilePicName',
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
                      // controller: _inputmodifyName,
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
                    // controller: _inputModifyBirth,
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
                    // controller: _inputModifyBirth,
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
                      // controller: _inputModifyPhone,
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
                          onTap: () {},
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
                                border: Border.all(color: blackColor, width: 2),
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
  }
}
