import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xalo/pages/settings/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ajustes'),
      ),
    );
  }
}
