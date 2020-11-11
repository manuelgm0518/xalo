import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'info_controller.dart';

class InfoPage extends GetView<InfoController> {
  const InfoPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Info'),
      ),
    );
  }
}
