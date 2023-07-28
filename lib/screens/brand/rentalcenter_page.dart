import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class RentalCenterPage extends StatefulWidget {
  const RentalCenterPage({super.key});

  @override
  State<RentalCenterPage> createState() => _RentalCenterPageState();
}

class _RentalCenterPageState extends State<RentalCenterPage> {
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              controller: _scrollController,
              children: [
                RentalCenterMain(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: RentalIntroduce(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: RentalProduct(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: RentalCenterLocation(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: Footer(),
                ),
                bottomToTop(context, () => moveTop()),
              ],
            ),
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

// ---------- RentalCenter_Main -----------------------------------------------------------------------------------------------------
class RentalCenterMain extends StatelessWidget {
  const RentalCenterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            'assets/images/background/rental_center_bg.png',
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
                      'by 覺 Suit RentalCenter',
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
                        '바이각 수트렌탈센터',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '그 날을 위한 자신감, 바이각',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: WidgetAnimator(
              atRestEffect: WidgetRestingEffects.bounce(),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: whiteColor,
                size: 72,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- RentalCenter_Introduce -----------------------------------------------------------------------------------------------------
class RentalIntroduce extends StatefulWidget {
  const RentalIntroduce({super.key});

  @override
  State<RentalIntroduce> createState() => _RentalIntroduceState();
}

class _RentalIntroduceState extends State<RentalIntroduce> {
  List rentalImage = [
    'assets/images/rentalCenter/rental_center_1.png',
    'assets/images/rentalCenter/rental_center_2.png',
    'assets/images/rentalCenter/rental_center_3.png'
  ];
  List rentalText = [
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  ];

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
            SizedBox(
              width: widgetSize(context),
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                verticalDirection: VerticalDirection.up,
                alignment: WrapAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width < 800
                        ? widgetSize(context)
                        : widgetSize(context) / 2 - 20,
                    alignment: Alignment.centerRight,
                    child: Text(
                      rentalText[0],
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width < 800
                        ? widgetSize(context)
                        : widgetSize(context) / 2,
                    height: c1BoxSize(context) + 100,
                    child: fadeImage(rentalImage[0]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: widgetSize(context),
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  verticalDirection: VerticalDirection.down,
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : widgetSize(context) / 2,
                      height: c1BoxSize(context) + 100,
                      child: fadeImage(rentalImage[1]),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : widgetSize(context) / 2 - 20,
                      alignment: Alignment.centerRight,
                      child: Text(
                        rentalText[1],
                        style: TextStyle(
                          fontSize: h6FontSize(context),
                          color: blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: widgetSize(context),
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  verticalDirection: VerticalDirection.up,
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : widgetSize(context) / 2 - 20,
                      alignment: Alignment.centerRight,
                      child: Text(
                        rentalText[2],
                        style: TextStyle(
                          fontSize: h6FontSize(context),
                          color: blackColor,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? widgetSize(context)
                          : widgetSize(context) / 2,
                      height: c1BoxSize(context) + 100,
                      child: fadeImage(rentalImage[2]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: widgetSize(context),
                child: Text(
                  rentalText[3],
                  style: TextStyle(
                    fontSize: h6FontSize(context),
                    color: blackColor,
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

// ---------- RentalCenter_Product -----------------------------------------------------------------------------------------------------
class RentalProduct extends StatefulWidget {
  const RentalProduct({super.key});

  @override
  State<RentalProduct> createState() => _RentalProductState();
}

class _RentalProductState extends State<RentalProduct> {
  List rentalProducts = [
    'assets/images/rentalProducts/product_1.png',
    'assets/images/rentalProducts/product_2.png',
    'assets/images/rentalProducts/product_3.png',
    'assets/images/rentalProducts/product_4.png',
    'assets/images/rentalProducts/product_5.png',
    'assets/images/rentalProducts/product_6.png',
    'assets/images/rentalProducts/product_7.png',
    'assets/images/rentalProducts/product_8.png',
    'assets/images/rentalProducts/product_9.png',
    'assets/images/rentalProducts/product_10.png',
    'assets/images/rentalProducts/product_11.png',
    'assets/images/rentalProducts/product_12.png',
    'assets/images/rentalProducts/product_13.png',
    'assets/images/rentalProducts/product_14.png',
    'assets/images/rentalProducts/product_15.png',
    'assets/images/rentalProducts/product_16.png',
    'assets/images/rentalProducts/product_17.png',
    'assets/images/rentalProducts/product_18.png',
    'assets/images/rentalProducts/product_19.png',
    'assets/images/rentalProducts/product_20.png',
    'assets/images/rentalProducts/product_21.png',
    'assets/images/rentalProducts/product_22.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: widgetSize(context),
        // height: 800,
        child: Column(
          children: [
            Text(
              'Product',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontFamily: 'Cafe_24',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                width: widgetSize(context),
                child: GridView.builder(
                  itemCount: rentalProducts.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width < 800
                        ? 2
                        : MediaQuery.of(context).size.width < 1240
                            ? 3
                            : 4,
                    childAspectRatio: 1 / 1.2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: fadeImage(rentalProducts[index]),
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

// ---------- RentalCenter_Location -----------------------------------------------------------------------------------------------------
class RentalCenterLocation extends StatelessWidget {
  const RentalCenterLocation({super.key});

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
                                '바이각 수트렌탈센터',
                                style: TextStyle(
                                  fontSize: h2FontSize(context) - 2,
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                '인천광역시 미추홀구 숙골로43번길 158-19 3층',
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
