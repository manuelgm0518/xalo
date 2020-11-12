import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/components/background/main_drawer.dart';
import 'package:xalo/app_themes.dart';
import 'package:xalo/components/circle_icon_button.dart';
import 'package:xalo/components/udemy_card.dart';
import 'package:xalo/pages/main/feed/feed_controller.dart';

class FeedPage extends GetView<FeedController> {
  const FeedPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: CustomScrollView(
        controller: controller.scroll,
        physics: kBouncy,
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
                    child: Icon(MdiIcons.home, color: Colors.white),
                  ).clipRRect(all: kBorderRadius / 2).gestures(onTap: () => MainDrawerController.to.toggleNavigation()),
                  kSpacerW,
                  Text(
                    'Inicio',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ])),
            backgroundColor: Colors.white,
            shadowColor: kLightColor,
            pinned: true,
            actions: [
              CircleIconButton(
                  icon: Icon(MdiIcons.magnify),
                  backgroundColor: kPrimaryColor.withOpacity(0.25),
                  onTap: () => Get.rawSnackbar(title: 'Work In Progress!', message: 'Próximanmente...')),
              kSpacerW,
              Badge(
                position: BadgePosition.topEnd(top: 10, end: -5),
                elevation: 0,
                badgeContent: Text('1', style: TextStyle(color: Colors.white, fontSize: 11)),
                child:
                    CircleIconButton(icon: Icon(MdiIcons.bell), backgroundColor: kPrimaryColor.withOpacity(0.25), onTap: () => MainDrawerController.to.toggleNotifications(true)),
              ),
              kSpacerW,
              kSpacerW,
            ],
          ),
          SliverToBoxAdapter(
              child: Text(
            'Recomendado',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: kPrimaryColor),
          ).paddingSymmetric(horizontal: kSpacing * 2, vertical: 0).marginOnly(top: kSpacing * 2)),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                physics: kBouncy,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: kSpacing),
                child: Row(children: [
                  UdemyCard(
                    url: 'https://www.udemy.com/course/flutter-ios-android-fernando-herrera/',
                    background:
                        'https://img-a.udemycdn.com/course/240x135/2306140_8181.jpg?_CAk61nGJWnfaUB08nhb8k90n79PfAE7G1cVtPBmHfrArVB16tpmfPkl6akPuYYygMTsTu_CtQ6qvPSPlMpbmJ5TwOR99NPqzB9BAb1-Z8jfj1dDb5Ylammffyk',
                    title: 'Flutter, tu guía completa de desarrollo para IOS y Android',
                    price: r'149 MX$',
                  ),
                  kSpacerW,
                  UdemyCard(
                    url: 'https://www.udemy.com/course/curso-de-dart-and-flutter-con-firebase/',
                    background:
                        'https://img-a.udemycdn.com/course/240x135/2395960_c27f.jpg?umujmbeB6NM3J3VxFRTQLUh4WUODizOsrIW8W8HaqI9s7kbe9G-zjGYUL0h1CRrNgyX2TlM3_PLFEL4H1kqEAOXNNUcqSj3BTrDJrgZayWOmykXet4hkoCNVXVM',
                    title: 'Curso Dart & Flutter y Firebase Crud en servicios full stack',
                    price: r'279 MX$',
                  ),
                  kSpacerW,
                  UdemyCard(
                    url: 'https://www.udemy.com/course/flutter-avanzado-con-getx/',
                    background:
                        'https://img-a.udemycdn.com/course/240x135/3485304_10b6.jpg?aNcYwULTnXi_Ze1HCQdBP39FImHuJMiu42eIqJGcUfblJXhsKPfclrj9WaEqWDj0Sx_J07mxXaiCNdHDFrCGFJ3_ws9D6RJ76INp4nPA6MAJR9LL5WYq4g95uVc',
                    title: 'Flutter avanzado con GetX',
                    price: r'149 MX$',
                  ),
                ])),
          ),
          SliverToBoxAdapter(
              child: Text(
            'Novedades',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: kPrimaryColor),
          ).paddingSymmetric(horizontal: kSpacing * 2, vertical: 0).marginOnly(top: kSpacing * 2)),
          SliverAnimatedList(
            key: controller.listKey,
            initialItemCount: controller.feed.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(sizeFactor: animation, child: Padding(padding: EdgeInsets.symmetric(horizontal: kSpacing / 2), child: controller.feed[index]));
              //.animate(Duration(milliseconds: 500), Curves.easeInOutExpo);
            },
          )
        ],
      ),
      floatingActionButton: Obx(() => SpeedDial(
            child: Stack(alignment: Alignment.center, children: [
              Styled.icon(MdiIcons.close, color: Colors.white)
                  .scale(all: controller.openFAB.value ? 1 : 0.01, animate: true)
                  .opacity(controller.openFAB.value ? 1 : 0, animate: true)
                  .animate(Duration(milliseconds: 300), Curves.easeInOutExpo),
              Image.asset('assets/app/xalo_isotype_white.png', width: 30)
                  .scale(all: controller.openFAB.value ? 0.01 : 1, animate: true)
                  .rotate(angle: controller.openFAB.value ? 45 : 0, animate: true)
                  .opacity(controller.openFAB.value ? 0 : 1, animate: true)
                  .animate(Duration(milliseconds: 300), Curves.easeInOutExpo),
            ]),
            overlayOpacity: 0.0,
            visible: controller.visibleFAB.value,
            curve: Curves.easeInOutExpo,
            animationSpeed: 300,
            onOpen: () => controller.openFAB.value = true,
            onClose: () => controller.openFAB.value = false,
            children: [
              SpeedDialChild(
                  child: Icon(MdiIcons.fileAccount, color: kAccentColor),
                  backgroundColor: Colors.white,
                  onTap: () => Get.toNamed('/create_vacancy'),
                  labelWidget: Container(
                      decoration: BoxDecoration(color: kAccentColor, borderRadius: kCircular),
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Text('Crear Vacante').textColor(Colors.white))),
              SpeedDialChild(
                child: Icon(MdiIcons.headLightbulb, color: kAccentColor),
                backgroundColor: Colors.white,
                elevation: 2,
                onTap: () => Get.toNamed('/create_project'),
                labelWidget: Container(
                    decoration: BoxDecoration(color: kAccentColor, borderRadius: kCircular),
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Text('Crear Proyecto').textColor(Colors.white)),
              ),
            ],
          )),
    );
  }
}
