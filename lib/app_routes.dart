import 'package:get/get.dart';
import 'package:xalo/pages/info/info_page.dart';
import 'package:xalo/pages/landing/intro_controller.dart';
import 'package:xalo/pages/landing/intro_page.dart';
import 'package:xalo/pages/main/feed/feed_controller.dart';
import 'package:xalo/pages/main/feed/feed_page.dart';
import 'package:xalo/pages/main/inbox/inbox_controller.dart';
import 'package:xalo/pages/main/inbox/inbox_page.dart';
import 'package:xalo/pages/main/jales/jales_controller.dart';
import 'package:xalo/pages/main/jales/jales_page.dart';
import 'package:xalo/pages/main/projects/projects_controller.dart';
import 'package:xalo/pages/settings/settings_page.dart';
import 'package:xalo/pages/wip_page.dart';
import 'pages/info/info_controller.dart';
import 'pages/landing/forms/login_controller.dart';
import 'pages/landing/forms/login_page.dart';
import 'pages/landing/forms/signup_controller.dart';
import 'pages/landing/forms/signup_page.dart';
import 'pages/main/projects/projects_page.dart';
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
      page: () => WipPage(),
      //page: () => LoginPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<LoginController>(() => LoginController())),
    ),
    GetPage(
      name: '/signup',
      page: () => WipPage(),
      //page: () => SignupPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<SignupController>(() => SignupController())),
    ),
    //MAIN
    GetPage(
      name: '/main/feed',
      page: () => FeedPage(),
      binding: BindingsBuilder(() => Get.lazyPut<FeedController>(() => FeedController())),
    ),
    GetPage(
      name: '/main/inbox',
      page: () => WipPage(),
      //page: () => InboxPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<InboxController>(() => InboxController())),
    ),
    GetPage(
      name: '/main/jales',
      page: () => WipPage(),
      //page: () => JalesPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<JalesController>(() => JalesController())),
    ),
    GetPage(
      name: '/main/projects',
      page: () => WipPage(),
      //page: () => ProjectsPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<ProjectsController>(() => ProjectsController())),
    ),
    //FORMS
    /*GetPage(
      name: '/create_vacancy',
      page: () => ProjectsPage(),
      binding: BindingsBuilder(() => Get.lazyPut<ProjectsController>(() => ProjectsController())),
    ),*/
    GetPage(
      name: '/create_project',
      page: () => WipPage(),
      //page: () => ProjectsPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<ProjectsController>(() => ProjectsController())),
    ),
    //OTHERS
    GetPage(
      name: '/settings',
      page: () => WipPage(),
      //page: () => SettingsPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<SettingsController>(() => SettingsController())),
    ),
    GetPage(
      name: '/info',
      page: () => WipPage(),
      // page: () => InfoPage(),
      //binding: BindingsBuilder(() => Get.lazyPut<InfoController>(() => InfoController())),
    ),
  ];
}
