import 'package:flutter/material.dart';
import 'package:opscroll_web/opscroll_web.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '김주현바이각',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440,
      height: 120,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/images/logos/bykakLogo_w.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: InkWell(
                    child: Text(
                      '브랜드',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: InkWell(
                    child: Text(
                      '홍보',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: InkWell(
                    child: Text(
                      '제품',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: InkWell(
                    child: Text(
                      '커뮤니티',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: InkWell(
                    child: Text(
                      '비즈니스',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(
                //     right: 20,
                //   ),
                //   child: InkWell(
                //     child: Text(
                //       'KOR',
                //       style: TextStyle(
                //         fontSize: 20,
                //         color: Colors.white,
                //       ),
                //     ),
                //     onTap: () {},
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: InkWell(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          OpscrollWeb(
            pageController: _pageController,
            onePageChildren: [
              CarouselScreen(),
              BykakStory(),
              TailorShopScreen(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.green,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
              ),
            ],
            scrollCurve: Curves.easeIn,
            scrollSpeed: const Duration(milliseconds: 1000),
            isFloatingButtonActive: false,
            scrollingAnimationOptions: ScrollingAnimationOptions.Default,
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int _currentPage = 0;
  List<String> mainBackground = [
    'assets/images/tailorShop_bg.png',
    'assets/images/tailorAcademy_bg.png',
    'assets/images/jemulpoClub_bg.png',
    'assets/images/rentalCenter_bg.png',
  ];
  List<String> mainTitles = [
    'k!mjuhyeon by 覺',
    'by 覺 Tailor Academy',
    'New JemulpoClub',
    'by 覺 RentalCenter',
  ];
  List<String> mainSubTitles = [
    '전통과 정통을 바느질하다.',
    '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
    '개화기 제물포구락부의 역사를 계승하고자 합니다.',
    '그 날을 위한 자신감, 바이각',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: Duration(milliseconds: 7000),
          autoPlayAnimationDuration: Duration(milliseconds: 1500),
          autoPlayCurve: Curves.fastOutSlowIn,
          onPageChanged: (index, reason) {
            _currentPage = index;
            print(index);
          },
        ),
        itemBuilder: (context, index, realIndex) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  mainBackground[index],
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainTitles[index],
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 20,
                  ),
                  child: Text(
                    mainSubTitles[index],
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        'view',
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: mainBackground.length,
      ),
    );
  }
}

class BykakStory extends StatelessWidget {
  const BykakStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: SizedBox(
          width: 1400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'By 覺 Story',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  '2014년 김주현바이각은 인천의 고급 수제양복을 알리기 위해,\n남성들을 위한 올바른 스타일링과 문화적 놀이터를 만들고자 설립되었습니다.',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TailorShopScreen extends StatelessWidget {
  const TailorShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: SizedBox(
          width: 1400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'k!mjuhyeon by 覺',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                ),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '자세히보기',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 640,
                    height: 360,
                    color: Colors.black,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '총 10,000,000 벌 제작',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '총 100,000,000 번의 바느질',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '총 1,000,000,000 시간의 제작시간',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
