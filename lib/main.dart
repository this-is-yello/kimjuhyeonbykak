import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
// import 'package:kimjuhyeonbykak/variable.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';
import 'package:kimjuhyeonbykak/screens/publicity_page.dart';
import 'package:kimjuhyeonbykak/screens/product_page.dart';
import 'package:kimjuhyeonbykak/screens/community_page.dart';
import 'package:kimjuhyeonbykak/screens/business_page.dart';
import 'package:kimjuhyeonbykak/screens/login_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/tailorshop_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/tailoracademy_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/jemulpoclub_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/rentalcenter_page.dart';

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
        GetPage(
          name: '/',
          page: () => const MainPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/tailorShop',
          page: () => const TailorShopPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/tailorAcademy',
          page: () => const TailorAcademyPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/newJemulpoClub',
          page: () => const JemulpoClubPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/rentalCenter',
          page: () => const RentalCenterPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/publicity',
          page: () => const PublicityPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/product',
          page: () => const ProductPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/community',
          page: () => const CommunityPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/business',
          page: () => const BusinessPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
        GetPage(
          name: '/login',
          page: () => const LogInPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 700),
        ),
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

  arrowChange() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          currentArrow = Icons.keyboard_arrow_up_rounded;
        });
        print('arrow_change!');
      } else {
        setState(() {
          currentArrow = Icons.keyboard_arrow_down_rounded;
        });
      }
    });
  }

  movePage() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _scrollController.animateTo(
          MediaQuery.of(context).size.height * btnCurrentPage,
          duration: const Duration(milliseconds: 1800),
          curve: Curves.fastOutSlowIn,
        );
        btnCurrentPage = 1;
      });
    } else {
      _scrollController.animateTo(
        MediaQuery.of(context).size.height * btnCurrentPage,
        duration: const Duration(milliseconds: 1800),
        curve: Curves.fastOutSlowIn,
      );
      btnCurrentPage++;
    }
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
          ListView(
            controller: _scrollController,
            children: const [
              CarouselScreen(),
              BykakStory(),
              TailorShopScreen(),
              TailorAcademyScreen(),
              NewJemulpoClubScreen(),
              Padding(
                padding: EdgeInsets.only(top: 120, bottom: 120),
                child: MainComment(),
              ),
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
                    color: blackColor.withOpacity(0.5),
                  ),
                  child: IconButton(
                    alignment: Alignment.center,
                    iconSize: c6BoxSize(context),
                    onPressed: () {
                      // btnPageMove();
                      movePage();
                      print(btnCurrentPage);
                      // _scrollController.animateTo(
                      //   MediaQuery.of(context).size.height * btnCurrentPage,
                      //   duration: const Duration(milliseconds: 1800),
                      //   curve: Curves.fastOutSlowIn,
                      // );
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
