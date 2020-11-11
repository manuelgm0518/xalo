import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';
import 'intro_controller.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Intro'),
        Text('Aquí agreguen el slider de paginitas'),
        kSpacerH,
        RaisedButton(onPressed: () => Get.toNamed('/login'), child: Text('Login')),
        RaisedButton(onPressed: () => Get.toNamed('/signup'), child: Text('Signup'))
      ],
    ));
  }
}
