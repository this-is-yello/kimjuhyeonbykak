import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'dart:math';
import 'package:file_picker/file_picker.dart';
// import 'package:get/get.dart';

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
    print('업로드 중일겁니다..');
    Future.delayed(
      Duration(milliseconds: 5000),
      () {
        var getUrl_1 = ref_1.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            thumbnailUrl = value;
          }
        });
        var getUrl_2 = ref_2.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            contentUrl = value;
          }
          if (thumbnailUrl != null && contentUrl != null) {
            var magazineData = firestore.collection('magazine').doc().set({
              'name': auth.currentUser!.displayName,
              'date': DateTime.now().toString(),
              'title': _inputMagazineTitle.text,
              'thumbnail': thumbnailUrl.toString(),
              'content': contentUrl.toString(),
            });
            print('업로드 완료');
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
            shrinkWrap: true,
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
    print('업로드 중일겁니다..');
    Future.delayed(
      Duration(milliseconds: 5000),
      () {
        var getUrl_1 = ref_1.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            thumbnailUrl = value;
          }
        });
        var getUrl_2 = ref_2.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            contentUrl = value;
          }
          if (thumbnailUrl != null && contentUrl != null) {
            var magazineData = firestore.collection('news').doc().set({
              'name': auth.currentUser!.displayName,
              'date': DateTime.now().toString(),
              'company': _inputNewsCompany.text,
              'title': _inputNewsTitle.text,
              'thumbnail': thumbnailUrl.toString(),
              'content': contentUrl.toString(),
            });
            print('업로드 완료');
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
            shrinkWrap: true,
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
class NotificationUpModal extends StatefulWidget {
  const NotificationUpModal({super.key});

  @override
  State<NotificationUpModal> createState() => _NotificationUpModalState();
}

class _NotificationUpModalState extends State<NotificationUpModal> {
  var _inputNotificationTitle = TextEditingController();
  var _inputNotification = TextEditingController();

  uploadNotification() async {
    if (_inputNotificationTitle.text != null &&
        _inputNotification.text != null) {
      var notificationData =
          await firestore.collection('notification').doc().set({
        'name': auth.currentUser!.displayName,
        'date': DateTime.now().toString(),
        'value': '공지사항',
        'title': _inputNotificationTitle.text,
        'content': _inputNotification.text,
      });
      print('업로드 완료');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Container(
          width: widgetSize(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
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
                            controller: _inputNotificationTitle,
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
                          controller: _inputNotification,
                          cursorColor: blackColor,
                          maxLines: 18,
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            color: blackColor,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: blackColor,
                                width: 2,
                              ),
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
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          uploadNotification();
                          Navigator.pop(context);
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

// ---------- Event_Upload_Modal -----------------------------------------------------------------------------------------------------
class EventUpModal extends StatefulWidget {
  const EventUpModal({super.key});

  @override
  State<EventUpModal> createState() => _EventUpModalState();
}

class _EventUpModalState extends State<EventUpModal> {
  var _inputEventTitle = TextEditingController();
  var _inputEventSubTitle = TextEditingController();
  var _inputEventDate = TextEditingController();

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

  Future uploadEvent() async {
    final ref_1 = firestorage.ref('post/event/$thumbnailName');
    final ref_2 = firestorage.ref('post/event/$contentName');
    ref_1.putData(thumbnailByte);
    ref_2.putData(contentByte);
    print('업로드 중일겁니다..');
    Future.delayed(
      Duration(milliseconds: 5000),
      () {
        var getUrl_1 = ref_1.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            thumbnailUrl = value;
          }
        });
        var getUrl_2 = ref_2.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            contentUrl = value;
          }
          if (thumbnailUrl != null && contentUrl != null) {
            var eventData = firestore.collection('event').doc().set({
              'name': auth.currentUser!.displayName,
              'date': _inputEventDate.text,
              'value': '이벤트',
              'title': _inputEventTitle.text,
              'subtitle': _inputEventSubTitle.text,
              'thumbnail': thumbnailUrl.toString(),
              'content': contentUrl.toString(),
            });
            print('업로드 완료');
          }
        });
      },
    );
  }

  uploadComplete() {
    if (_inputEventTitle.text == '' ||
        _inputEventSubTitle.text == '' ||
        _inputEventDate.text == '' ||
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
      uploadEvent();
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
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Container(
          width: widgetSize(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
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
                            controller: _inputEventTitle,
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
                            controller: _inputEventSubTitle,
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
                              '진행날짜',
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
                            controller: _inputEventDate,
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: '23.01.01 - 23.01.01',
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
    );
  }
}

// ---------- Media_Upload_Modal -----------------------------------------------------------------------------------------------------
class MediaUpModal extends StatefulWidget {
  const MediaUpModal({super.key});

  @override
  State<MediaUpModal> createState() => _MediaUpModalState();
}

class _MediaUpModalState extends State<MediaUpModal> {
  var _inputMediaTitle = TextEditingController();
  var _inputMediaLink = TextEditingController();

  PlatformFile? thumbnailPick;
  String? thumbnailName;
  String? thumbnailUrl;
  var thumbnailByte;

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

  Future uploadMedia() async {
    final ref_1 = firestorage.ref('post/media/$thumbnailName');
    ref_1.putData(thumbnailByte);
    print('업로드 중일겁니다..');
    Future.delayed(
      Duration(milliseconds: 5000),
      () {
        var getUrl_1 = ref_1.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            thumbnailUrl = value;
          }
          if (thumbnailUrl != null) {
            var eventData = firestore.collection('media').doc().set({
              'name': auth.currentUser!.displayName,
              'date': DateTime.now().toString(),
              'title': _inputMediaTitle.text,
              'link': _inputMediaLink.text,
              'thumbnail': thumbnailUrl.toString(),
            });
            print('업로드 완료');
          }
        });
      },
    );
  }

  uploadComplete() {
    if (_inputMediaTitle.text == '' ||
        _inputMediaLink.text == '' ||
        thumbnailByte == null) {
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
      uploadMedia();
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
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Container(
          width: widgetSize(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
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
                            controller: _inputMediaTitle,
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
                            controller: _inputMediaLink,
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

// ---------- Product_Upload_Modal -----------------------------------------------------------------------------------------------------
class ProductUpModal extends StatefulWidget {
  const ProductUpModal({super.key});

  @override
  State<ProductUpModal> createState() => _ProductUpModalState();
}

class _ProductUpModalState extends State<ProductUpModal> {
  PlatformFile? thumbnailPick;
  String? thumbnailName;
  String? thumbnailUrl;
  var thumbnailByte;

  Future selectThumbnail() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: true,
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

  Future uploadProduct() async {
    final ref_1 = firestorage.ref('post/product/$thumbnailName');
    ref_1.putData(thumbnailByte);
    print('업로드 중일겁니다..');
    Future.delayed(
      Duration(milliseconds: 5000),
      () {
        var getUrl_1 = ref_1.getDownloadURL().then((value) {
          if (value == null) {
            print(value);
          } else {
            thumbnailUrl = value;
          }
          if (thumbnailUrl != null) {
            var productData = firestore.collection('product').doc().set({
              'name': auth.currentUser!.displayName,
              'date': DateTime.now().toString(),
              'thumbnail': thumbnailUrl.toString(),
            });
            print('업로드 완료');
          }
        });
      },
    );
  }

  uploadComplete() {
    if (thumbnailByte == null) {
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
      uploadProduct();
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
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Container(
          width: widgetSize(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
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
