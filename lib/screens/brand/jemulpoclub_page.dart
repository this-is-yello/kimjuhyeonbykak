import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

class JemulpoClubPage extends StatelessWidget {
  const JemulpoClubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                JemulpoClubMain(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: JemulpoClubStudio(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: JemulpoClubFilming(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: JemulpoClubLocation(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: Footer(),
                ),
              ],
            ),
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

// ---------- JemulpoClub_Main -----------------------------------------------------------------------------------------------------
class JemulpoClubMain extends StatelessWidget {
  const JemulpoClubMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            'assets/images/jemulpoClub_bg.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 120),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New JemulpoClub',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontFamily: 'Cafe_24',
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        '신제물포구락부',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '다양한 수트를 입어보면서 올바른 옷입기에 도움이 돼..',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ---------- JemulpoClub_Studio -----------------------------------------------------------------------------------------------------
class JemulpoClubStudio extends StatelessWidget {
  const JemulpoClubStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: widgetSize(context),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: widgetSize(context),
                      height: c1BoxSize(context) + 200,
                      color: blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: widgetSize(context),
                        child: Center(
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 60,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: widgetSize(context),
                        height: c1BoxSize(context) + 200,
                        color: blackColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: widgetSize(context),
                          child: Center(
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 60,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: widgetSize(context),
                        height: c1BoxSize(context) + 200,
                        color: blackColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: widgetSize(context),
                          child: Center(
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/panorama.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/panorama.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: widgetSize(context),
                  child: Center(
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 60, right: 20),
          child: SizedBox(
            width: widgetSize(context),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: widgetSize(context),
                      height: c1BoxSize(context) + 80,
                      color: blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: widgetSize(context),
                        height: c1BoxSize(context) + 80,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: widgetSize(context),
                    height: c1BoxSize(context) + 300,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                          PointerDeviceKind.trackpad,
                        },
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            width: c1BoxSize(context) + 100,
                            height: c1BoxSize(context) + 300,
                            margin: EdgeInsets.only(right: 20),
                            color: blackColor,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: Center(
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ---------- JemulpoClub_Filming -----------------------------------------------------------------------------------------------------
class JemulpoClubFilming extends StatelessWidget {
  const JemulpoClubFilming({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          children: [
            Text(
              'Filming',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontFamily: 'Cafe_24',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: widgetSize(context),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width < 800
                                  ? widgetSize(context)
                                  : widgetSize(context) / 2 - 10,
                              height: c1BoxSize(context) + 100,
                              color: blackColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width < 800
                                    ? widgetSize(context)
                                    : widgetSize(context) / 2 - 10,
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(
                                    fontSize: h6FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width < 800
                                  ? widgetSize(context)
                                  : widgetSize(context) / 2 - 10,
                              height: c1BoxSize(context) + 100,
                              color: blackColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width < 800
                                    ? widgetSize(context)
                                    : widgetSize(context) / 2 - 10,
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(
                                    fontSize: h6FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width < 800
                                  ? widgetSize(context)
                                  : widgetSize(context) / 2 - 10,
                              height: c1BoxSize(context) + 100,
                              color: blackColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width < 800
                                    ? widgetSize(context)
                                    : widgetSize(context) / 2 - 10,
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(
                                    fontSize: h6FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width < 800
                                  ? widgetSize(context)
                                  : widgetSize(context) / 2 - 10,
                              height: c1BoxSize(context) + 100,
                              color: blackColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width < 800
                                    ? widgetSize(context)
                                    : widgetSize(context) / 2 - 10,
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(
                                    fontSize: h6FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- JemulpoClub_Location -----------------------------------------------------------------------------------------------------
class JemulpoClubLocation extends StatelessWidget {
  const JemulpoClubLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          children: [
            Text(
              'Location',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontFamily: 'Cafe_24',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: Column(
                children: [
                  Container(
                    width: widgetSize(context),
                    height: c1BoxSize(context) + 200,
                    color: blackColor,
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '신제물포구락부',
                                style: TextStyle(
                                  fontSize: h2FontSize(context) - 2,
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                '인천광역시 미추홀구 석정로200 지하1층',
                                style: TextStyle(
                                  fontSize: h6FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.map_outlined,
                              size: 32,
                              color: blackColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.copy,
                                size: 32,
                                color: blackColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
