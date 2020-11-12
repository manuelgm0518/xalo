import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';
import 'package:xalo/components/background/main_drawer.dart';
import 'package:xalo/components/circle_icon_button.dart';
import 'package:xalo/pages/main/jales/jales_controller.dart';

class JalesPage extends GetView<JalesController> {
  const JalesPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          iconTheme: IconThemeData(color: kPrimaryColor, size: 25),
          expandedHeight: 120,
          toolbarHeight: 55,
          collapsedHeight: 60,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsetsDirectional.only(start: 16, bottom: 10),
              background: Container(color: kLightColor),
              title: Row(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Container(
                  padding: EdgeInsets.all(kSpacing / 2),
                  color: kPrimaryColor,
                  child: Icon(MdiIcons.briefcase, color: Colors.white),
                ).clipRRect(all: kBorderRadius / 2).gestures(onTap: () => MainDrawerController.to.toggleNavigation()),
                kSpacerW,
                Text(
                  'Jales',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ])),
          backgroundColor: Colors.white,
          shadowColor: kLightColor,
          pinned: true,
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 10, end: -5),
              elevation: 0,
              badgeContent: Text('1', style: TextStyle(color: Colors.white, fontSize: 11)),
              child: CircleIconButton(icon: Icon(MdiIcons.bell), backgroundColor: kPrimaryColor.withOpacity(0.25), onTap: () => MainDrawerController.to.toggleNotifications(true)),
            ),
            kSpacerW,
            kSpacerW,
          ],
        ),
      ],
    ));
  }
}
