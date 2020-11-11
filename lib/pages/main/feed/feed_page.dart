import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/components/background/main_drawer.dart';
import 'package:xalo/app_themes.dart';
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
            expandedHeight: 130,
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius / 2), color: kPrimaryColor),
                    child: Icon(MdiIcons.home, color: Colors.white),
                  ).ripple().gestures(onTap: () => MainDrawerController.to.toggleNavigation()),
                  kSpacerW,
                  Text(
                    'Inicio',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ])),
            backgroundColor: Colors.white,
            shadowColor: kLightColor,
            pinned: true,
            actions: [
              Container(
                padding: EdgeInsets.all(kSpacing / 2),
                decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor.withOpacity(0.25)),
                child: Icon(MdiIcons.magnify),
              ).ripple(),
              kSpacerW,
              Badge(
                  position: BadgePosition.topEnd(top: 10),
                  elevation: 0,
                  badgeContent: Text(
                    '77',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(kSpacing / 2),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor.withOpacity(0.25)),
                    child: Icon(MdiIcons.bell),
                  ).ripple()),
              kSpacerW,
              kSpacerW,
            ],
          ),

          //SliverToBoxAdapter(), //Recomendations
          SliverAnimatedList(
            key: controller.listKey,
            initialItemCount: controller.items.length,
            itemBuilder: (context, index, animation) {
              return Card(margin: EdgeInsets.symmetric(horizontal: kSpacing, vertical: kSpacing / 2), child: Text(controller.items[index]).marginAll(kSpacing * 4));
            },
          )
        ],
      ),
      floatingActionButton: Obx(() => SpeedDial(
            child: Stack(alignment: Alignment.center, children: [
              Styled.icon(MdiIcons.close, color: Colors.white)
                  .scale(all: controller.openFAB.value ? 1 : 0.1, animate: true)
                  .opacity(controller.openFAB.value ? 1 : 0, animate: true)
                  .animate(Duration(milliseconds: 300), Curves.easeInOutExpo),
              Image.asset('assets/app/xalo_isotype_white.png', width: 30)
                  .scale(all: controller.openFAB.value ? 0.1 : 1, animate: true)
                  .opacity(controller.openFAB.value ? 0 : 1, animate: true)
                  .animate(Duration(milliseconds: 300), Curves.easeInOutExpo),
            ]),
            overlayOpacity: 0.0,
            visible: controller.visibleFAB.value,
            curve: Curves.easeInOutExpo,
            onOpen: () => controller.openFAB.value = true,
            onClose: () => controller.openFAB.value = false,
            // onPress: () => controller.addItem(),
            children: [
              SpeedDialChild(
                child: Icon(Icons.accessibility, color: Colors.white),
                backgroundColor: Colors.deepOrange,
                onTap: () => print('FIRST CHILD'),
                label: 'First Child',
                labelStyle: TextStyle(fontWeight: FontWeight.w500),
                labelBackgroundColor: Colors.deepOrangeAccent,
              ),
              SpeedDialChild(
                child: Icon(Icons.brush, color: Colors.white),
                backgroundColor: Colors.green,
                onTap: () => print('SECOND CHILD'),
                label: 'Second Child',
                labelStyle: TextStyle(fontWeight: FontWeight.w500),
                labelBackgroundColor: Colors.green,
              ),
              SpeedDialChild(
                child: Icon(Icons.keyboard_voice, color: Colors.white),
                backgroundColor: Colors.blue,
                onTap: () => print('THIRD CHILD'),
                labelWidget: Container(
                  color: Colors.blue,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(6),
                  child: Text('Custom Label Widget'),
                ),
              ),
            ],
          )),
    );
  }
}
