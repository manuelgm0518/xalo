import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:xalo/app_themes.dart';

class ErrorDialog {
  const ErrorDialog({this.error, this.description});
  final String error;
  final String description;
  Future show() {
    return Get.dialog(
      Card(
        margin: const EdgeInsets.all(kSpacing * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset('assets/animations/error.json', repeat: false),
            kSpacerH,
            Text(error ?? 'Oops!', style: Get.textTheme.headline3),
            Text(description ?? 'Parece que algo salió mal\nVuelve a intentarlo más tarde.', style: Get.textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
