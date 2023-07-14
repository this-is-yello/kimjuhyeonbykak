import 'dart:html';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/style.dart';
// import 'package:kimjuhyeonbykak/main.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

// ---------- Magazine_Upload_Modal -----------------------------------------------------------------------------------------------------
class MagazineUpModal extends StatefulWidget {
  const MagazineUpModal({super.key});

  @override
  State<MagazineUpModal> createState() => _MagazineUpModalState();
}

class _MagazineUpModalState extends State<MagazineUpModal> {
  var _inputMagazineTitle = TextEditingController();

  PlatformFile? thumbnailPick;
  String? thumbnailName;
  String? thumbnailUrl;
  var thumbnailByte;
  PlatformFile? contentPick;
  String? contentName;
  String? contentUrl;
  var contentByte;

  Future selectThumbnail() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        thumbnailByte = result.files.first.bytes;
        thumbnailName = result.files.first.name;
        thumbnailPick = result.files.first;
      });
      print(thumbnailName);
    } else {
      print('thumbnail is null');
    }
  }

  Future selectContent() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        contentByte = result.files.first.bytes;
        contentName = result.files.first.name;
        contentPick = result.files.first;
      });
      print(contentName);
    } else {
      print('content is null');
    }
  }

  Future uploadMagazine() async {
    final ref_1 = firestorage.ref('post/magazine/$thumbnailName');
    final ref_2 = firestorage.ref('post/magazine/$contentName');
    ref_1.putData(thumbnailByte);
    ref_2.putData(contentByte);
    Future.delayed(
      Duration(milliseconds: 10000),
      () {
        var getUrl_1 = ref_1.getDownloadURL().then((value) {
          if (value == null) {
            print('업로드 중일겁니다..');
          } else {
            thumbnailUrl = value;
          }
        });
        var getUrl_2 = ref_2.getDownloadURL().then((value) {
          if (value == null) {
            print('업로드 중일겁니다..');
          } else {
            contentUrl = value;
            var magazineData = firestore.collection('magazine').doc().set({
              'name': auth.currentUser!.displayName,
              'date': DateTime.now().toString(),
              'title': _inputMagazineTitle.text,
              'thumbnail': thumbnailUrl.toString(),
              'content': contentUrl.toString(),
            });
          }
        });
      },
    );
  }

  uploadComplete() {
    if (_inputMagazineTitle.text == '' ||
        thumbnailByte == null ||
        contentByte == null) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(
            Duration(milliseconds: 1200),
            () => Navigator.pop(context),
          );
          return Dialog(
            child: Container(
              width: 200,
              height: 80,
              child: Center(
                child: Text(
                  '입력되지 않은 정보가 있습니다.',
                  style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      Navigator.pop(context);
      uploadMagazine();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text('업로드 완료하였습니다.'),
          ),
          backgroundColor: bykakColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          width: widgetSize(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Center(
                child: Text(
                  '매거진 업로드',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            width: c4BoxSize(context),
                            child: Text(
                              '제목',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _inputMagazineTitle,
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: '제목을 입력하세요.',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: blackColor,
                      ),
                    ),
                  ],
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
                          '썸네일',
                          style: TextStyle(
                            fontSize: h3FontSize(context),
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            selectThumbnail();
                          },
                          child: Text(
                            '썸네일 업로드',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Container(
                        width: widgetSize(context),
                        height: c3BoxSize(context),
                        child: Text(
                          thumbnailName == null ? '파일없음' : '$thumbnailName',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '컨텐츠',
                    style: TextStyle(
                      fontSize: h3FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      selectContent();
                    },
                    child: Text(
                      '컨텐츠 업로드',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  width: widgetSize(context),
                  height: c3BoxSize(context),
                  child: Text(
                    contentName == null ? '파일없음' : '$contentName',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: h5FontSize(context),
                    ),
                  ),
                ),
              ),
              Container(
                width: widgetSize(context),
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          uploadComplete();
                        },
                        child: Container(
                          height: c5BoxSize(context),
                          child: Center(
                            child: Text(
                              '업로드',
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
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: c5BoxSize(context),
                            child: Center(
                              child: Text(
                                '닫기',
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
      ),
    );
  }
}

// ---------- News_Upload_Modal -----------------------------------------------------------------------------------------------------
class NewsUpModal extends StatefulWidget {
  const NewsUpModal({super.key});

  @override
  State<NewsUpModal> createState() => _NewsUpModalState();
}

class _NewsUpModalState extends State<NewsUpModal> {
  var _inputNewsTitle = TextEditingController();
  var _inputNewsCompany = TextEditingController();

  PlatformFile? thumbnailPick;
  String? thumbnailName;
  String? thumbnailUrl;
  var thumbnailByte;
  PlatformFile? contentPick;
  String? contentName;
  String? contentUrl;
  var contentByte;

  Future selectThumbnail() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        thumbnailByte = result.files.first.bytes;
        thumbnailName = result.files.first.name;
        thumbnailPick = result.files.first;
      });
      print(thumbnailName);
    } else {
      print('thumbnail is null');
    }
  }

  Future selectContent() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        contentByte = result.files.first.bytes;
        contentName = result.files.first.name;
        contentPick = result.files.first;
      });
      print(contentName);
    } else {
      print('content is null');
    }
  }

  Future uploadNews() async {
    final ref_1 = firestorage.ref('post/news/$thumbnailName');
    final ref_2 = firestorage.ref('post/news/$contentName');
    ref_1.putData(thumbnailByte);
    ref_2.putData(contentByte);
    Future.delayed(
      Duration(milliseconds: 10000),
      () {
        var getUrl_1 = ref_1.getDownloadURL().then((value) {
          if (value == null) {
            print('업로드 중일겁니다..');
          } else {
            thumbnailUrl = value;
          }
        });
        var getUrl_2 = ref_2.getDownloadURL().then((value) {
          if (value == null) {
            print('업로드 중일겁니다..');
          } else {
            contentUrl = value;
            var magazineData = firestore.collection('news').doc().set({
              'name': auth.currentUser!.displayName,
              'date': DateTime.now().toString(),
              'company': _inputNewsCompany.text,
              'title': _inputNewsTitle.text,
              'thumbnail': thumbnailUrl.toString(),
              'content': contentUrl.toString(),
            });
          }
        });
      },
    );
  }

  uploadComplete() {
    if (_inputNewsTitle.text == '' ||
        thumbnailByte == null ||
        contentByte == null) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(
            Duration(milliseconds: 1200),
            () => Navigator.pop(context),
          );
          return Dialog(
            child: Container(
              width: 200,
              height: 80,
              child: Center(
                child: Text(
                  '입력되지 않은 정보가 있습니다.',
                  style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      Navigator.pop(context);
      uploadNews();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text('업로드 완료하였습니다.'),
          ),
          backgroundColor: bykakColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          width: widgetSize(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Center(
                child: Text(
                  '보도자료 업로드',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            width: c4BoxSize(context),
                            child: Text(
                              '제목',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _inputNewsTitle,
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: '제목을 입력하세요.',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            width: c4BoxSize(context),
                            child: Text(
                              '신문사',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _inputNewsCompany,
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: '신문사 이름을 입력하세요.',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '썸네일',
                          style: TextStyle(
                            fontSize: h3FontSize(context),
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            selectThumbnail();
                          },
                          child: Text(
                            '썸네일 업로드',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Container(
                        width: widgetSize(context),
                        height: c3BoxSize(context),
                        child: Text(
                          thumbnailName == null ? '파일없음' : '$thumbnailName',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '컨텐츠',
                    style: TextStyle(
                      fontSize: h3FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      selectContent();
                    },
                    child: Text(
                      '컨텐츠 업로드',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  width: widgetSize(context),
                  height: c3BoxSize(context),
                  child: Text(
                    contentName == null ? '파일없음' : '$contentName',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: h5FontSize(context),
                    ),
                  ),
                ),
              ),
              Container(
                width: widgetSize(context),
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          uploadComplete();
                        },
                        child: Container(
                          height: c5BoxSize(context),
                          child: Center(
                            child: Text(
                              '업로드',
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
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: c5BoxSize(context),
                            child: Center(
                              child: Text(
                                '닫기',
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
      ),
    );
  }
}

// ---------- Notification_Upload_Modal -----------------------------------------------------------------------------------------------------
void notificationUpload(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: whiteColor,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SizedBox(
              width: widgetSize(context),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      '공지사항 업로드',
                      style: TextStyle(
                        fontSize: h2FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SizedBox(
                                width: c4BoxSize(context),
                                child: Text(
                                  '제목',
                                  style: TextStyle(
                                    fontSize: h3FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                // controller: _inputNotificationTitle,
                                style: TextStyle(
                                  fontSize: h4FontSize(context),
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: '제목을 입력하세요.',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '내용',
                          style: TextStyle(
                            fontSize: h3FontSize(context),
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: widgetSize(context),
                            height: c1BoxSize(context) + 200,
                            child: TextField(
                              // controller: _inputNotification,
                              cursorColor: blackColor,
                              maxLines: 18,
                              style: TextStyle(
                                fontSize: h4FontSize(context),
                                color: blackColor,
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: blackColor, width: 2),
                                ),
                                hintText: '내용을 입력하세요.',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: c5BoxSize(context),
                              child: Center(
                                child: Text(
                                  '업로드',
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
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: c5BoxSize(context),
                                child: Center(
                                  child: Text(
                                    '닫기',
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
          ),
        ),
      );
    },
  );
}

// ---------- Event_Upload_Modal -----------------------------------------------------------------------------------------------------
void eventUpload(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: whiteColor,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SizedBox(
              width: widgetSize(context),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      '이벤트 업로드',
                      style: TextStyle(
                        fontSize: h2FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SizedBox(
                                width: c4BoxSize(context),
                                child: Text(
                                  '제목',
                                  style: TextStyle(
                                    fontSize: h3FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                // controller: _inputEventTitle,
                                style: TextStyle(
                                  fontSize: h4FontSize(context),
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: '제목을 입력하세요.',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SizedBox(
                                width: c4BoxSize(context),
                                child: Text(
                                  '서브제목',
                                  style: TextStyle(
                                    fontSize: h4FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                // controller: _inputEventSubTitle,
                                style: TextStyle(
                                  fontSize: h4FontSize(context),
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: '제목을 입력하세요.',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '썸네일',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '썸네일 업로드',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: widgetSize(context),
                            height: c1BoxSize(context) + 100,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '컨텐츠',
                        style: TextStyle(
                          fontSize: h3FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '컨텐츠 업로드',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: widgetSize(context),
                      height: c1BoxSize(context) + 100,
                      color: blackColor,
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: c5BoxSize(context),
                              child: Center(
                                child: Text(
                                  '업로드',
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
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: c5BoxSize(context),
                                child: Center(
                                  child: Text(
                                    '닫기',
                                    style: TextStyle(
                                      fontSize: h4FontSize(context),
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: blackColor,
                                    width: 2,
                                  ),
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
          ),
        ),
      );
    },
  );
}

// ---------- Media_Upload_Modal -----------------------------------------------------------------------------------------------------
void mediaUpload(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: whiteColor,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SizedBox(
              width: widgetSize(context),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      '미디어 업로드',
                      style: TextStyle(
                        fontSize: h2FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SizedBox(
                                width: c4BoxSize(context),
                                child: Text(
                                  '제목',
                                  style: TextStyle(
                                    fontSize: h3FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                // controller: _inputMediaTitle,
                                style: TextStyle(
                                  fontSize: h4FontSize(context),
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: '제목을 입력하세요.',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SizedBox(
                                width: c4BoxSize(context),
                                child: Text(
                                  '링크',
                                  style: TextStyle(
                                    fontSize: h3FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                // controller: _inputMediaLink,
                                style: TextStyle(
                                  fontSize: h4FontSize(context),
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: '링크을 입력하세요.',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '썸네일',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '썸네일 업로드',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: widgetSize(context),
                            height: c1BoxSize(context) + 100,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: c5BoxSize(context),
                              child: Center(
                                child: Text(
                                  '업로드',
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
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: c5BoxSize(context),
                                child: Center(
                                  child: Text(
                                    '닫기',
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
          ),
        ),
      );
    },
  );
}

// ---------- Product_Upload_Modal -----------------------------------------------------------------------------------------------------
void productUpload(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: whiteColor,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SizedBox(
              width: widgetSize(context),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      '제품 업로드',
                      style: TextStyle(
                        fontSize: h2FontSize(context),
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
                          children: [
                            Text(
                              '썸네일',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '썸네일 업로드',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: widgetSize(context),
                            height: c1BoxSize(context) + 100,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '상세보기',
                        style: TextStyle(
                          fontSize: h3FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '상세보기 업로드',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: widgetSize(context),
                      height: c1BoxSize(context) + 100,
                      color: blackColor,
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: c5BoxSize(context),
                              child: Center(
                                child: Text(
                                  '업로드',
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
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: c5BoxSize(context),
                                child: Center(
                                  child: Text(
                                    '닫기',
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
          ),
        ),
      );
    },
  );
}
