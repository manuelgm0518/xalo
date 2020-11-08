import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'landing_controller.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => "Joaquín se la ha comido:\n${controller.comidasDelJoako.value} veces".text.make().centered()),
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        onPressed: () => controller.joakinComersela(),
      ),
    );
  }
}
