import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:get/get.dart';

class EventViewPage extends StatefulWidget {
  const EventViewPage({super.key});

  @override
  State<EventViewPage> createState() => _EventViewPageState();
}

class _EventViewPageState extends State<EventViewPage> {
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
              EventViewContent(),
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

// ---------- EventView_Content -----------------------------------------------------------------------------------------------------
class EventViewContent extends StatefulWidget {
  const EventViewContent({super.key});

  @override
  State<EventViewContent> createState() => _EventViewContentState();
}

class _EventViewContentState extends State<EventViewContent> {
  var eventDocs;

  searchEvent() async {
    var searchResult = await firestore
        .collection('event')
        .orderBy('date', descending: true)
        .get();
    setState(() {
      eventDocs = searchResult.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    searchEvent();
  }

  @override
  Widget build(BuildContext context) {
    try {
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
                        'assets/images/background/jemulpo_club_bg.png',
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
                                '이벤트',
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
                        communityNum = 2;
                      });
                      Get.rootDelegate.toNamed(Routes.COMMUNITY);
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: widgetSize(context),
                        child: Text(
                          '[${eventDocs[eventNum]['value']}] ${eventDocs[eventNum]['title']}',
                          style: TextStyle(
                            fontSize: h3FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widgetSize(context),
                      child: Row(
                        children: [
                          Text(
                            eventDocs[eventNum]['name'],
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              eventDocs[eventNum]['date'],
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 32),
                      child: Container(
                        width: widgetSize(context),
                        height: 2,
                        color: greyColor,
                      ),
                    ),
                    SizedBox(
                      width: widgetSize(context),
                      child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Image.network(
                            eventDocs[eventNum]['content'],
                            fit: BoxFit.fitWidth,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print(e);
      return Container(
        width: widgetSize(context),
        height: MediaQuery.of(context).size.height,
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
