import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xalo/app_themes.dart';

class LoadingDialog {
  Future show() {
    return Get.dialog(
      Center(
        child: Card(
          margin: EdgeInsets.all(kSpacing * 3),
          child: Padding(
            padding: EdgeInsets.all(kSpacing * 3),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
