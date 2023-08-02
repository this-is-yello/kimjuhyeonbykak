import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'dart:ui';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class PublicityPage extends StatefulWidget {
  const PublicityPage({super.key});

  @override
  State<PublicityPage> createState() => _PublicityPageState();
}

class _PublicityPageState extends State<PublicityPage> {
  final ScrollController _scrollController = ScrollController();

  scrollState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent ||
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        setState(() {
          topState = true;
        });
      } else {
        setState(() {
          topState = false;
        });
      }
    });
  }

  moveTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    topState = true;
    inMypage = false;
    scrollState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: [
              PublicityContent(),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                ),
                child: Footer(),
              ),
              bottomToTop(context, () => moveTop()),
            ],
          ),
          MainAppBar(),
        ],
      ),
      floatingActionButton: topState
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: FloatingActionButton(
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: whiteColor,
                  size: 30,
                ),
                backgroundColor: bykakColor,
                onPressed: () {
                  moveTop();
                },
              ),
            ),
    );
  }
}

// ---------- Publicity_Content -----------------------------------------------------------------------------------------------------
class PublicityContent extends StatefulWidget {
  const PublicityContent({super.key});

  @override
  State<PublicityContent> createState() => _PublicityContentState();
}

class _PublicityContentState extends State<PublicityContent> {
  List publicityTitle = ['매거진', '보도자료', '협찬'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: c1BoxSize(context) + 200,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      width: MediaQuery.of(context).size.width,
                      height: c1BoxSize(context) + 200,
                      'assets/images/background/tailor_academy_bg.png',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: c1BoxSize(context) + 200,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            blackColor.withOpacity(0),
                            whiteColor,
                          ],
                          stops: [0, 1],
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: SizedBox(
                      width: widgetSize(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Text(
                              publicityTitle[publicityNum],
                              style: TextStyle(
                                fontSize: h1FontSize(context),
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                          ),
                          Text(
                            '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: Container(
                  width: 360,
                  height: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: blackColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {
                          setState(() {
                            publicityNum = 0;
                          });
                        },
                        child: Text(
                          '매거진',
                          style: TextStyle(
                            fontSize: publicityNum == 0 ? 14 : 13,
                            fontWeight: publicityNum == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {
                          setState(() {
                            publicityNum = 1;
                          });
                        },
                        child: Text(
                          '보도자료',
                          style: TextStyle(
                            fontSize: publicityNum == 1 ? 14 : 13,
                            fontWeight: publicityNum == 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: elevatedBtnTheme,
                        onPressed: () {
                          setState(() {
                            publicityNum = 2;
                          });
                        },
                        child: Text(
                          '협찬',
                          style: TextStyle(
                            fontSize: publicityNum == 2 ? 14 : 13,
                            fontWeight: publicityNum == 2
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FadeIn(
                child: publicityNum == 0
                    ? MagazineScreen()
                    : publicityNum == 1
                        ? NewsScreen()
                        : SponsorShipScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------- Magazine -----------------------------------------------------------------------------------------------------
class MagazineScreen extends StatefulWidget {
  const MagazineScreen({super.key});

  @override
  State<MagazineScreen> createState() => _MagazineScreenState();
}

class _MagazineScreenState extends State<MagazineScreen> {
  var magazineDocs;
  var magazineDocsLength;

  searchMagazine() async {
    var searchResult = await firestore
        .collection('magazine')
        .orderBy('date', descending: true)
        .get();
    setState(() {
      magazineDocs = searchResult.docs;
      magazineDocsLength = searchResult.docs.length;
    });
    print(magazineDocsLength);
  }

  @override
  void initState() {
    super.initState();
    searchMagazine();
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (magazineDocs[i]['thumbnail'] != null) {
        return SizedBox(
          width: widgetSize(context),
          child: Column(
            children: [
              GridView.builder(
                itemCount: magazineDocsLength.hashCode,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 800 ? 1 : 2,
                  childAspectRatio: 3 / 2.3,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        magazineNum = index;
                      });
                      Get.rootDelegate
                          .toNamed('${Routes.MAGAZINEVIEW}/$magazineNum');
                      print(magazineNum);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: ImageFade(
                              image: NetworkImage(
                                magazineDocs[index]['thumbnail'],
                              ),
                              fit: BoxFit.cover,
                              duration: const Duration(milliseconds: 900),
                              syncDuration: const Duration(milliseconds: 150),
                              placeholder: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              errorBuilder: (context, error) => Container(
                                color: const Color(0xFFFFFFFF),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.warning,
                                  color: Color(0xFF1E1E1E),
                                  size: 128.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                magazineDocs[index]['date']
                                    .toString()
                                    .substring(0, 10),
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                ),
                                child: Text(
                                  magazineDocs[index]['title'],
                                  style: TextStyle(
                                    fontSize: h4FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      } else {
        return Container(
          width: widgetSize(context),
          height: 300,
          child: Center(
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
    } catch (e) {
      print(e);
      return Container(
        width: widgetSize(context),
        height: 300,
        child: Center(
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

// ---------- News -----------------------------------------------------------------------------------------------------
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var newsDocs;
  var newsDocsLength;

  searchNews() async {
    var searchResult = await firestore
        .collection('news')
        .orderBy('date', descending: true)
        .get();
    setState(() {
      newsDocs = searchResult.docs;
      newsDocsLength = searchResult.docs.length;
    });
    print(newsDocsLength);
  }

  @override
  void initState() {
    super.initState();
    searchNews();
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (newsDocs[i]['thumbnail'] != null) {
        return SizedBox(
          width: widgetSize(context),
          child: ListView.builder(
            itemCount: newsDocsLength.hashCode,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      newsNum = index;
                    });
                    Get.rootDelegate.toNamed('${Routes.NEWSVIEW}/$newsNum');
                    print(newsNum);
                  },
                  child: Container(
                    width: widgetSize(context),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: blackColor,
                          width: 2,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Container(
                          width: c1BoxSize(context),
                          height: c1BoxSize(context) - 40,
                          child: ImageFade(
                            image: NetworkImage(
                              newsDocs[index]['thumbnail'],
                            ),
                            fit: BoxFit.cover,
                            duration: const Duration(milliseconds: 900),
                            syncDuration: const Duration(milliseconds: 150),
                            placeholder: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: blackColor,
                                ),
                              ),
                            ),
                            errorBuilder: (context, error) => Container(
                              color: const Color(0xFFFFFFFF),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.warning,
                                color: Color(0xFF1E1E1E),
                                size: 128.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                ),
                                child: Text(
                                  newsDocs[index]['title'],
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: h5FontSize(context),
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              Text(
                                newsDocs[index]['date']
                                    .toString()
                                    .substring(0, 10),
                                style: TextStyle(
                                  fontSize: h6FontSize(context),
                                  color: blackColor,
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
            },
          ),
        );
      } else {
        return Container(
          width: widgetSize(context),
          height: 300,
          child: Center(
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
    } catch (e) {
      return Container(
        width: widgetSize(context),
        height: 300,
        child: Center(
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

// ---------- Sponsorship -----------------------------------------------------------------------------------------------------
class SponsorShipScreen extends StatefulWidget {
  const SponsorShipScreen({super.key});

  @override
  State<SponsorShipScreen> createState() => _SponsorShipScreenState();
}

class _SponsorShipScreenState extends State<SponsorShipScreen> {
  List celebrity = [
    'assets/images/sponsorShip/sponsor_ship_1.jpg',
    'assets/images/sponsorShip/sponsor_ship_2.jpg',
    'assets/images/sponsorShip/sponsor_ship_3.jpg',
    'assets/images/sponsorShip/sponsor_ship_4.jpg',
    'assets/images/sponsorShip/sponsor_ship_5.jpg',
    'assets/images/sponsorShip/sponsor_ship_6.jpg',
    'assets/images/sponsorShip/sponsor_ship_7.jpg',
    'assets/images/sponsorShip/sponsor_ship_8.jpg',
    'assets/images/sponsorShip/sponsor_ship_9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: widgetSize(context),
                height: c1BoxSize(context) + 200,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.2 / 1,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: celebrity.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: fadeImage(celebrity[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
