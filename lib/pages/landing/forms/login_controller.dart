import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xalo/services/session.dart';

class LoginController extends GetxController {
  final formKey = new GlobalKey<FormState>();
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  void validateForm() {
    if (formKey.currentState.validate()) {
      //Session.loggedIn = true;
      //Get.offAndToNamed('/main/feed');
    }
  }
}
