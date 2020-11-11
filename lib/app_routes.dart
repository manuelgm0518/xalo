import 'package:get/get.dart';
import 'package:xalo/pages/info/info_page.dart';
import 'package:xalo/pages/landing/intro_controller.dart';
import 'package:xalo/pages/landing/intro_page.dart';
import 'package:xalo/pages/main/feed/feed_controller.dart';
import 'package:xalo/pages/main/feed/feed_page.dart';
import 'package:xalo/pages/main/inbox/inbox_controller.dart';
import 'package:xalo/pages/main/inbox/inbox_page.dart';
import 'pages/info/info_controller.dart';
import 'pages/landing/forms/login_controller.dart';
import 'pages/landing/forms/login_page.dart';
import 'pages/landing/forms/signup_controller.dart';
import 'pages/landing/forms/signup_page.dart';
import 'pages/settings/settings_controller.dart';

class AppRoutes {
  static final routes = [
    //LANDING
    GetPage(
      name: '/intro',
      page: () => IntroPage(),
      binding: BindingsBuilder(() => Get.lazyPut<IntroController>(() => IntroController())),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: BindingsBuilder(() => Get.lazyPut<LoginController>(() => LoginController())),
    ),
    GetPage(
      name: '/signup',
      page: () => SignupPage(),
      binding: BindingsBuilder(() => Get.lazyPut<SignupController>(() => SignupController())),
    ),
    //MAIN
    GetPage(
      name: '/main/feed',
      page: () => FeedPage(),
      binding: BindingsBuilder(() => Get.lazyPut<FeedController>(() => FeedController())),
    ),
    GetPage(
      name: '/main/inbox',
      page: () => InboxPage(),
      binding: BindingsBuilder(() => Get.lazyPut<InboxController>(() => InboxController())),
    ),
    GetPage(
      name: '/main/jales',
      page: () => FeedPage(),
      binding: BindingsBuilder(() => Get.lazyPut<FeedController>(() => FeedController())),
    ),
    GetPage(
      name: '/main/projects',
      page: () => FeedPage(),
      binding: BindingsBuilder(() => Get.lazyPut<FeedController>(() => FeedController())),
    ),
    //OTHERS
    GetPage(
      name: '/settings',
      page: () => FeedPage(),
      binding: BindingsBuilder(() => Get.lazyPut<SettingsController>(() => SettingsController())),
    ),
    GetPage(
      name: '/info',
      page: () => InfoPage(),
      binding: BindingsBuilder(() => Get.lazyPut<InfoController>(() => InfoController())),
    ),
  ];
}
