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
  File? thumbnail;
  File? _image_2;
  final ImagePicker picker = ImagePicker();

  Future getImage_1(ImageSource imageSource) async {
    final _picker_1 = await picker.pickImage(source: imageSource);
    Reference _magazinthumbnail =
        firestorage.ref().child('magazine/post_1/thumnail.png');
    if (_picker_1 != null) {
      setState(() {
        thumbnail = File(_picker_1.path);
      });
      if (kIsWeb) {
        await _magazinthumbnail.putFile(File(thumbnail!.path));
      }
    }
  }

  PlatformFile? pickFile;
  Future selectThumbnail() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      print('nnuullll');
    } else {
      setState(() {
        pickFile = result.files.first;
      });
    }
  }

  Future uploadThumbnail() async {
    final gg = 'files/testimg.png';
    final file = File(pickFile!.path!);

    final ref = firestorage.ref().child(gg);
    ref.putFile(file);
  }

  Future getImage_2(ImageSource imageSource) async {
    final pickedFile_2 = await picker.pickImage(source: imageSource);
    if (pickedFile_2 != null) {
      setState(() {
        _image_2 = File(pickedFile_2.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                              //getImage 함수를 호출해서 갤러리에서 사진 가져오기
                              // getImage_1(ImageSource.gallery);
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
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: widgetSize(context),
                          height: c1BoxSize(context) + 100,
                          child: pickFile != null
                              ? Image.file(
                                  File(pickFile!.path!),
                                  fit: BoxFit.fitHeight,
                                )
                              : SizedBox(),
                          // color: blackColor,
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
                        //getImage 함수를 호출해서 갤러리에서 사진 가져오기
                        getImage_2(ImageSource.gallery);
                        // uploadImage();
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
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: widgetSize(context),
                    height: c1BoxSize(context) + 100,
                    child: _image_2 != null
                        ? Image.network(
                            _image_2!.path,
                            fit: BoxFit.fitHeight,
                          )
                        : SizedBox(),
                    // color: blackColor,
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
                            uploadThumbnail();
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
      ),
    );
  }
}

// ---------- News_Upload_Modal -----------------------------------------------------------------------------------------------------
void newsUpload(BuildContext context) {
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
                                // controller: _inputNewsTitle,
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
