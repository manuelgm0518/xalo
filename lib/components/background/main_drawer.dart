import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:xalo/app_themes.dart';
import 'navigation_drawer.dart';
import 'notification_drawer.dart';
import 'package:styled_widget/styled_widget.dart';

class MainDrawerController extends GetxController {
  static MainDrawerController get to => Get.find();
  final drawerKey = GlobalKey<InnerDrawerState>();
  void toggleNavigation([bool open]) {
    if (open == null)
      drawerKey.currentState.toggle(direction: InnerDrawerDirection.start);
    else if (open)
      drawerKey.currentState.open(direction: InnerDrawerDirection.start);
    else
      drawerKey.currentState.close(direction: InnerDrawerDirection.start);
  }

  void toggleNotifications([bool open]) {
    if (open == null)
      drawerKey.currentState.toggle(direction: InnerDrawerDirection.end);
    else if (open)
      drawerKey.currentState.open(direction: InnerDrawerDirection.end);
    else
      drawerKey.currentState.close(direction: InnerDrawerDirection.end);
  }
}

class MainDrawer extends GetView<MainDrawerController> {
  const MainDrawer({Key key, this.child, this.controllerKey}) : super(key: key);
  final Widget child;
  final GlobalKey<InnerDrawerState> controllerKey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainDrawerController>(
      builder: (_) => InnerDrawer(
        key: controllerKey,
        onTapClose: true,
        swipe: Get.currentRoute.contains('/main'),
        colorTransitionChild: kPrimaryColor,
        colorTransitionScaffold: Colors.transparent,
        offset: IDOffset.only(bottom: 0.05, right: 0.5, left: 0.5),
        scale: IDOffset.horizontal(0.8),
        borderRadius: kBorderRadius,
        backgroundDecoration: BoxDecoration(color: kPrimaryColor),
        leftChild: Material(
            color: Colors.transparent,
            child: SafeArea(child: NavigationDrawer(selected: Get.currentRoute.split('/').last).padding(horizontal: kSpacing * 2, vertical: kSpacing * 5))),
        rightChild: Material(color: Colors.transparent, child: SafeArea(child: NotificationDrawer().padding(horizontal: kSpacing * 2, vertical: kSpacing * 5))),
        scaffold: Container(color: kLightColor, child: child),
        boxShadow: [kShadow],
      ),
    );
  }
}
