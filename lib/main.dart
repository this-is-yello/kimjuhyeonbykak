import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:kimjuhyeonbykak/screens/first_screen.dart';
import 'package:kimjuhyeonbykak/screens/login_page.dart';

import 'package:kimjuhyeonbykak/screens/brand/story_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/tailorshop_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/tailoracademy_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/jemulpoclub_page.dart';
import 'package:kimjuhyeonbykak/screens/brand/rentalcenter_page.dart';

import 'package:kimjuhyeonbykak/screens/publicity/publicity_page.dart';
import 'package:kimjuhyeonbykak/screens/publicity/magazine_view_page.dart';
import 'package:kimjuhyeonbykak/screens/publicity/news_view_page.dart';

import 'package:kimjuhyeonbykak/screens/product_page.dart';

import 'package:kimjuhyeonbykak/screens/community/community_page.dart';

import 'package:kimjuhyeonbykak/screens/business/business_page.dart';

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
  static const MAGAZINEVIEW = '/publicity/magazineview';
  static const NEWSVIEW = '/publicity/newsview';
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
    // ---------------------------------------- About_Brand ----------------------------------------
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
    // ---------------------------------------- About_Publicity ----------------------------------------
    GetPage(
      name: Routes.PUBLICITY,
      page: () => const PublicityPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.NEWSVIEW,
      page: () => const NewsViewPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: Routes.MAGAZINEVIEW,
      page: () => const MagazineViewPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    // ---------------------------------------- Product ----------------------------------------
    GetPage(
      name: Routes.PRODUCT,
      page: () => const ProductPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    // ---------------------------------------- About_Community ----------------------------------------
    GetPage(
      name: Routes.COMMUNITY,
      page: () => const CommunityPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    // ---------------------------------------- Business ----------------------------------------
    GetPage(
      name: Routes.BUSINESS,
      page: () => const BusinessPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 700),
    ),
    // ---------------------------------------- Login ----------------------------------------
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'LINE_seed',
          primaryColor: blackColor,
        ),
        // darkTheme: FlexThemeData.dark(scheme: FlexScheme.amber),
        // themeMode: ThemeMode.system,
        // defaultTransition: Transition.fade,
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
