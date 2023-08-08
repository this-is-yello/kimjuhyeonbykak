import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:get/get.dart';

class MagazineViewPage extends StatefulWidget {
  const MagazineViewPage({super.key});

  @override
  State<MagazineViewPage> createState() => _MagazineViewPageState();
}

class _MagazineViewPageState extends State<MagazineViewPage> {
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
              MagazineViewContent(),
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

// ---------- MagazineView_Content -----------------------------------------------------------------------------------------------------
class MagazineViewContent extends StatefulWidget {
  const MagazineViewContent({super.key});

  @override
  State<MagazineViewContent> createState() => _MagazineViewContentState();
}

class _MagazineViewContentState extends State<MagazineViewContent> {
  var magazineDocs;

  searchMagazine() async {
    var searchResult = await firestore.collection('magazine').get();
    setState(() {
      magazineDocs = searchResult.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    searchMagazine();
  }

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
                      'assets/images/background/story_bg.png',
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
                              '매거진',
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
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      publicityNum = 0;
                    });
                    Get.rootDelegate.toNamed(Routes.PUBLICITY);
                  },
                  child: SizedBox(
                    width: c2BoxSize(context),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: c6BoxSize(context),
                          color: blackColor,
                        ),
                        Text(
                          '뒤로가기',
                          style: TextStyle(
                            fontSize: h3FontSize(context),
                            height: 1.5,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: widgetSize(context),
                child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    try {
                      return Image.network(
                        magazineDocs[magazineNum]['content'],
                        fit: BoxFit.fitWidth,
                      );
                    } catch (e) {
                      return Container(
                        width: widgetSize(context),
                        height: 500,
                        child: Center(
                          child: CircularProgressIndicator(color: blackColor),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
