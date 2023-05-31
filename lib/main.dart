import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
// import 'package:kimjuhyeonbykak/variable.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';
import 'package:kimjuhyeonbykak/screens/tailorshop_page.dart';
import 'package:kimjuhyeonbykak/screens/tailoracademy_page.dart';
import 'package:kimjuhyeonbykak/screens/jemulpoclub_page.dart';
import 'package:kimjuhyeonbykak/screens/rentalcenter_page.dart';

// import 'package:opscroll_web/opscroll_web.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '김주현바이각',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MainPage()),
        GetPage(name: '/tailorShop', page: () => const TailorShopPage()),
        GetPage(name: '/tailorAcademy', page: () => const TailorAcademyPage()),
        GetPage(name: '/newJemulpoClub', page: () => const JemulpoClubPage()),
        GetPage(name: '/rentalCenter', page: () => const RentalCenterPage()),
      ],
      theme: ThemeData(
        fontFamily: 'LINE_seed',
        primaryColor: blackColor,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  IconData currentArrow = Icons.keyboard_arrow_down_rounded;

  btnPageMove() {
    if (btnCurrentPage > 4 || scrollCurrentPage > 4) {
      setState(() {
        btnCurrentPage = 0;
        scrollCurrentPage = 0;
      });
    } else {
      setState(() {
        btnCurrentPage++;
        // scrollCurrentPage++;
      });
    }
  }

  arrowChange() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          currentArrow = Icons.keyboard_arrow_up_rounded;
          scrollCurrentPage = 5;
        });
        print('arrow_change!');
      } else {
        setState(() {
          currentArrow = Icons.keyboard_arrow_down_rounded;
        });
      }

      if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        btnCurrentPage = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    arrowChange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // OpscrollWeb(
          //   pageController: _pageController,
          //   dropColor: blackColor,
          //   scrollingAnimationOptions: ScrollingAnimationOptions.Fading,
          //   onePageChildren: [
          //     CarouselScreen(),
          //     BykakStory(),
          //     TailorShopScreen(),
          //     TailorAcademyScreen(),
          //     NewJemulpoClubScreen(),
          //   ],
          // ),
          ListView(
            controller: _scrollController,
            children: const [
              CarouselScreen(),
              BykakStory(),
              TailorShopScreen(),
              TailorAcademyScreen(),
              NewJemulpoClubScreen(),
              Footer(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MainAppBar(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: c5BoxSize(context) - 4,
                  height: c5BoxSize(context) - 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: blackColor.withOpacity(0.9),
                  ),
                  child: IconButton(
                    alignment: Alignment.center,
                    iconSize: c6BoxSize(context),
                    onPressed: () {
                      btnPageMove();
                      _scrollController.animateTo(
                        MediaQuery.of(context).size.height * btnCurrentPage,
                        duration: const Duration(milliseconds: 1800),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    icon: Icon(
                      currentArrow,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
