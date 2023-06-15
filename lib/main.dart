import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';
import 'package:kimjuhyeonbykak/screens/publicity_page.dart';
import 'package:kimjuhyeonbykak/screens/product_page.dart';
import 'package:kimjuhyeonbykak/screens/community_page.dart';
import 'package:kimjuhyeonbykak/screens/business_page.dart';
import 'package:kimjuhyeonbykak/screens/login_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/story_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/tailorshop_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/tailoracademy_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/jemulpoclub_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/rentalcenter_page.dart';

import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class Routes {
  static const MAIN = '/';
  static const STORY = '/story';
  static const TAILORSHOP = '/tailorShop';
  static const TAILORACADEMY = '/tailorAcademy';
  static const NEWJUMULPOCLUB = '/newJemulpoClub';
  static const RENTALCENTER = '/rentalCenter';
  static const PUBLICITY = '/publicity';
  static const PRODUCT = '/product';
  static const COMMUNITY = '/community';
  static const BUSINESS = '/business';
  static const LOGIN = '/login';
}

class AppRouterDelegate extends GetDelegate {
  GetNavConfig get prevRoute =>
      history.length < 2 ? history.last : history[history.length - 2];

  @override
  Future<GetNavConfig> popHistory() async {
    final result = prevRoute;
    Get.rootDelegate.offNamed(prevRoute.currentPage!.name);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    print(history.toString());
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.MAIN)!.currentPage!],
    );
  }
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.STORY,
      page: () => const StoryPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.TAILORSHOP,
      page: () => const TailorShopPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.TAILORACADEMY,
      page: () => const TailorAcademyPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.NEWJUMULPOCLUB,
      page: () => const JemulpoClubPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.RENTALCENTER,
      page: () => const RentalCenterPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.PUBLICITY,
      page: () => const PublicityPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => const ProductPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.COMMUNITY,
      page: () => const CommunityPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.BUSINESS,
      page: () => const BusinessPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LogInPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
  ];
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (GetPlatform.isWeb) {
    runApp(
      GetMaterialApp.router(
        // theme: FlexThemeData.light(scheme: FlexScheme.amber),
        // // // The Mandy red, dark theme.
        // darkTheme: FlexThemeData.dark(scheme: FlexScheme.amber),
        // Use dark or light theme based on system setting.
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        routerDelegate: AppRouterDelegate(),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [
          const Locale('ko', 'KR'),
        ],
      ),
    );
  } else {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'LINE_seed',
          primaryColor: blackColor,
        ),
        getPages: AppPages.pages,
        initialRoute: '/',
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [
          const Locale('ko', 'KR'),
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '김주현바이각',
//       initialRoute: '/',
//       getPages: [
//         GetPage(
//           name: Routes.MAIN,
//           page: () => const MainPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.STORY,
//           page: () => const StoryPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.TAILORSHOP,
//           page: () => const TailorShopPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.TAILORACADEMY,
//           page: () => const TailorAcademyPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.NEWJUMULPOCLUB,
//           page: () => const JemulpoClubPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.RENTALCENTER,
//           page: () => const RentalCenterPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.PUBLICITY,
//           page: () => const PublicityPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.PRODUCT,
//           page: () => const ProductPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.COMMUNITY,
//           page: () => const CommunityPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.BUSINESS,
//           page: () => const BusinessPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//         GetPage(
//           name: Routes.LOGIN,
//           page: () => const LogInPage(),
//           transition: Transition.fadeIn,
//           transitionDuration: Duration(milliseconds: 700),
//         ),
//       ],
//       theme: ThemeData(
//         fontFamily: 'LINE_seed',
//         primaryColor: blackColor,
//       ),
//     );
//   }
// }

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
