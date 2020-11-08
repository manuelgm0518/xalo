import 'package:get/get.dart';
import 'package:xalo/modules/landing/landing_controller.dart';
import 'package:xalo/modules/landing/landing_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => LandingPage(),
      binding: BindingsBuilder(() => Get.lazyPut<LandingController>(() => LandingController())),
    )
  ];
}
