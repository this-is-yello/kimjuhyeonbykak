import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:kimjuhyeonbykak/screens/first_screen.dart';

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
import 'package:kimjuhyeonbykak/screens/community/notification_view_page.dart';
import 'package:kimjuhyeonbykak/screens/community/event_view_page.dart';

import 'package:kimjuhyeonbykak/screens/business/business_page.dart';

import 'package:kimjuhyeonbykak/screens/account/log_in_page.dart';
import 'package:kimjuhyeonbykak/screens/account/signup_page.dart';

import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class Routes {
  static const MAIN = '/';
  // ---------------------------------------- About_Brand ----------------------------------------
  static const STORY = '/story';
  static const TAILORSHOP = '/tailorShop';
  static const TAILORACADEMY = '/tailorAcademy';
  static const NEWJUMULPOCLUB = '/newJemulpoClub';
  static const RENTALCENTER = '/rentalCenter';
  // ---------------------------------------- About_Publicity ----------------------------------------
  static const PUBLICITY = '/publicity';
  static const MAGAZINEVIEW = '/publicity/magazineview';
  static const NEWSVIEW = '/publicity/newsview';
  // ---------------------------------------- Product ----------------------------------------
  static const PRODUCT = '/product';
  // ---------------------------------------- About_Community ----------------------------------------
  static const COMMUNITY = '/community';
  static const NOTIFICATIONVIEW = '/community/notification';
  static const EVENTVIEW = '/community/event';
  // ---------------------------------------- Business ----------------------------------------
  static const BUSINESS = '/business';
  // ---------------------------------------- About_sAccount ----------------------------------------
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
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
    ),
    // ---------------------------------------- About_Brand ----------------------------------------
    GetPage(
      name: Routes.STORY,
      page: () => const StoryPage(),
    ),
    GetPage(
      name: Routes.TAILORSHOP,
      page: () => const TailorShopPage(),
    ),
    GetPage(
      name: Routes.TAILORACADEMY,
      page: () => const TailorAcademyPage(),
    ),
    GetPage(
      name: Routes.NEWJUMULPOCLUB,
      page: () => const JemulpoClubPage(),
    ),
    GetPage(
      name: Routes.RENTALCENTER,
      page: () => const RentalCenterPage(),
    ),
    // ---------------------------------------- About_Publicity ----------------------------------------
    GetPage(
      name: Routes.PUBLICITY,
      page: () => const PublicityPage(),
    ),
    GetPage(
      name: Routes.NEWSVIEW,
      page: () => const NewsViewPage(),
    ),
    GetPage(
      name: Routes.MAGAZINEVIEW,
      page: () => const MagazineViewPage(),
    ),
    // ---------------------------------------- Product ----------------------------------------
    GetPage(
      name: Routes.PRODUCT,
      page: () => const ProductPage(),
    ),
    // ---------------------------------------- About_Community ----------------------------------------
    GetPage(
      name: Routes.COMMUNITY,
      page: () => const CommunityPage(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONVIEW,
      page: () => const NotificationViewPage(),
    ),
    GetPage(
      name: Routes.EVENTVIEW,
      page: () => const EventViewPage(),
    ),
    // ---------------------------------------- Business ----------------------------------------
    GetPage(
      name: Routes.BUSINESS,
      page: () => const BusinessPage(),
    ),
    // ---------------------------------------- About_Account ----------------------------------------
    GetPage(
      name: Routes.LOGIN,
      page: () => const LogInPage(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignUpPage(),
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
        title: 'kimjuhyeon by 覺',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'LINE_seed',
          primaryColor: blackColor,
        ),
        // darkTheme: FlexThemeData.dark(scheme: FlexScheme.amber),
        // themeMode: ThemeMode.system,
        defaultTransition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 1000),
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
        title: 'kimjuhyeon by 覺',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'LINE_seed',
          primaryColor: blackColor,
        ),
        defaultTransition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 1000),
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
