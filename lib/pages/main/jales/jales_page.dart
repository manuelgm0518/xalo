import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xalo/pages/main/jales/jales_controller.dart';

class JalesPage extends GetView<JalesController> {
  const JalesPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Jales'),
      ),
    );
  }
}
