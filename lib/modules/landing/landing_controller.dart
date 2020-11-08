import 'package:get/get.dart';

class LandingController extends GetxController {
  var comidasDelJoako = 0.obs;
  void joakinComersela() {
    comidasDelJoako.value++;
  }
}
