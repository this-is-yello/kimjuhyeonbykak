import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:countup/countup.dart';

class TailorShopPage extends StatelessWidget {
  const TailorShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            children: [
              TailorShopMain(),
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Shops(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Label(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: CountUpText(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: MakingProcess(),
              ),
            ],
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

class TailorShopMain extends StatelessWidget {
  const TailorShopMain({super.key});

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
            'assets/images/tailorShop_bg.png',
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
                      'k!mjuhyeon by 覺',
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
                        '김주현바이각',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '전통과 정통을 바느질하다.',
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

class Shops extends StatelessWidget {
  const Shops({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            width: widgetSize(context),
            child: Image.asset(
              'assets/images/tailorShop_bg.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text(
                  '직영 아뜰리에',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '단추 하나, 깃 하나로도 고객을 감동시키는 수트를 만들기 위해 40년 이상의 경력을 가진 7명의 장인을 직접 모셨습니다. 김주현바이각은 인천에서 유일하게 매장 내 수제 공방을 운영하며 비스포크 맞춤 수트의 정석을 구현하고 있습니다.',
                      textAlign: TextAlign.center,
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
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: SizedBox(
              width: widgetSize(context),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 600,
                      color: blackColor,
                      child: Center(
                          child: Text(
                        '제물포 본점',
                        style: TextStyle(
                          fontSize: 20,
                          color: whiteColor,
                        ),
                      )),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 600,
                      color: greyColor,
                      child: Center(
                          child: Text(
                        '인천 송도점',
                        style: TextStyle(
                          fontSize: 20,
                          color: whiteColor,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Text(
            'Label',
            style: TextStyle(
              fontSize: h1FontSize(context),
              fontFamily: 'Cafe_24',
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Container(
              width: widgetSize(context),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/blacklabel_bg.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '효율성을 배제한 장인정신이 깃든 "30"\n김주현바이각 Black Label',
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      '온전히 장인정신에 입각한 수 만번의 손 바느질',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    '김주현바이각의 헤리티지 브랜드 Black Label은 효율성을 배제한\n오직 맞춤슈트의 품질만을 생각하는 브랜드로서 특별한 고객만을 위한 매달 30벌의 수트만을 지어드리고 있습니다\n온전히 손 바느질만으로 완성되는 Black Label은 국내 및 세계의 다양하고 우수한 원단과 양질의 부자재들을 사용하고 있습니다.\n\n김주현바이각 Black Label의 주 고객들은 자신을 사랑하고, 자신감 넘치며 성공적인 삶을 사는 남성분들입니다.',
                    style: TextStyle(
                      fontSize: h7FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Text(
              '"시대 흐름을 초월한\n변치않는 클래식"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: h2FontSize(context),
                color: blackColor,
              ),
            ),
          ),
          Text(
            '수트는 시대를 초월해 남성을 가장 잘 표현할 수 있는 의복입니다.\n아들에게도 물려줄 수 있는 맞춤수트를 지어드리는 것이 우리의 변치않는 수트철학입니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: h6FontSize(context),
              color: blackColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              width: widgetSize(context),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/whitelabel_bg.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '트렌디하고 스타일쉬한\n김주현바이각 White label',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      '보다 간편히, 보다 트렌디한 수트',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    '김주현바이각의 매스티지 브랜드 White label은 고유의 비스포크 방식은 유지, 트렌디하고 컴포터블한 세퍼레잇 컬렉션을 전개합니다.\n스웨이드, 레더, 니트웨어 등 다양한 제품군을 선보이며 공정과정을 간략화 함으로써 부담없이 즐기실 수 있는 브랜드입니다.\n\n김주현바이각 White label은 여타 공장에서 제작되어진 브랜드 수트와 격이 다른 품위와 편안함을 느껴보실 수 있습니다.',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: h7FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Text(
              '"Sity In Wity"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: h2FontSize(context),
                color: blackColor,
              ),
            ),
          ),
          Text(
            '각박한 빌딩 숲, 똑같은 비즈니스 수트, 그 안에서 우리의 위트를 찾습니다.\n“입어서 즐거운 옷”  이것이 바로 White label의 철학입니다. Wity는 Wit와 City의 합성어입니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: h6FontSize(context),
              color: blackColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: SizedBox(
              width: widgetSize(context),
              height: 208,
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
                  // itemCount: ,
                  itemBuilder: (context, index) {
                    return Container(
                      width: c1BoxSize(context),
                      height: c1BoxSize(context),
                      margin: EdgeInsets.all(8),
                      color: blackColor,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountUpText extends StatelessWidget {
  const CountUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '총 ',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    color: blackColor,
                  ),
                ),
                SizedBox(
                  width: c3BoxSize(context),
                  child: Countup(
                    begin: 0,
                    end: 5981,
                    duration: const Duration(milliseconds: 3000),
                    separator: ',',
                    style: TextStyle(
                      fontSize: h1FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                Text(
                  '벌 제작',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    color: blackColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '총 ',
                    style: TextStyle(
                      fontSize: h3FontSize(context),
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    width: c1BoxSize(context) + 30,
                    child: Countup(
                      begin: 0,
                      end: 59804019,
                      duration: const Duration(milliseconds: 4000),
                      separator: ',',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Text(
                    '번의 바느질',
                    style: TextStyle(
                      fontSize: h3FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '총 ',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    color: blackColor,
                  ),
                ),
                SizedBox(
                  width: c2BoxSize(context) + 10,
                  child: Countup(
                    begin: 0,
                    end: 592119,
                    duration: const Duration(milliseconds: 3500),
                    separator: ',',
                    style: TextStyle(
                      fontSize: h1FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                Text(
                  '의 제작시간',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MakingProcess extends StatelessWidget {
  const MakingProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
