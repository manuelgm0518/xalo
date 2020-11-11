import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = new GlobalKey<FormState>();
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  void validateForm() {
    if (formKey.currentState.validate()) {
      Get.offAndToNamed('/main/feed');
    }
  }
}
