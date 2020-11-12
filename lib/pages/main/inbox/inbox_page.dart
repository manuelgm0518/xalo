import 'dart:math';

import 'package:badges/badges.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';
import 'package:xalo/components/background/main_drawer.dart';
import 'package:xalo/components/circle_icon_button.dart';
import 'inbox_controller.dart';

class InboxPage extends GetView<InboxController> {
  const InboxPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: kBouncy,
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: kPrimaryColor, size: 25),
              expandedHeight: 120,
              toolbarHeight: 55,
              collapsedHeight: 60,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              centerTitle: false,
              pinned: true,
              actions: [
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
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsetsDirectional.only(start: 16, bottom: 10),
                  background: Container(color: Colors.white),
                  title: Row(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      padding: EdgeInsets.all(kSpacing / 2),
                      color: kPrimaryColor,
                      child: Icon(MdiIcons.forum, color: Colors.white),
                    ).clipRRect(all: kBorderRadius / 2).gestures(onTap: () => MainDrawerController.to.toggleNavigation()),
                    kSpacerW,
                    Text(
                      'Mensajes',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ])),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                physics: kBouncy,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(kSpacing),
                child: Row(
                  children: [
                    for (int i = 0; i < 10; i++) userAvatar(i),
                  ],
                ),
              ),
            ),
            Obx(() => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return controller.chats[index];
                  }, childCount: controller.chats.length),
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(MdiIcons.plus, color: Colors.white, size: 35),
        ));
  }
}

Widget userAvatar(int index) {
  var isCompany = Random().nextBool();
  var name = Faker().person.name();

  if (isCompany) name = Faker().company.name();
  return Container(
    width: Get.width / 5,
    child: Column(
      children: [
        Badge(
          elevation: 0,
          position: BadgePosition.topEnd(),
          badgeContent: Icon(isCompany ? MdiIcons.officeBuilding : MdiIcons.account, color: Colors.white, size: 15),
          badgeColor: kAccentColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Container(
              color: Colors.grey[300],
              child: Image.network(
                'https://picsum.photos/200?random=${index + 1}',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ).marginAll(kSpacing),
        Text(name, textAlign: TextAlign.center, style: TextStyle(height: 1), maxLines: 2),
      ],
    ),
  );
}

class ChatTile extends StatelessWidget {
  const ChatTile({Key key, this.icon, this.name, this.lastMessage, this.lastDate, this.unreadCount = 1, this.watched = false, this.lastSender}) : super(key: key);
  final String icon;
  final String name;
  final String lastMessage;
  final DateTime lastDate;
  final int unreadCount;
  final bool watched;
  final String lastSender;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:
            ClipRRect(borderRadius: BorderRadius.circular(1000), child: Container(color: Colors.grey[300], child: Image.network(icon, width: 50, height: 50, fit: BoxFit.cover)))
                .marginOnly(bottom: 0),
        title: Row(children: [
          Expanded(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), softWrap: false, overflow: TextOverflow.ellipsis)),
          kSpacerW,
          Text(getTimeAgo(lastDate), style: TextStyle(color: kPrimaryColor, fontSize: 12)),
        ]).marginOnly(top: 10),
        subtitle: Row(children: [
          if (lastSender == null) Icon(MdiIcons.checkAll, color: watched ? Colors.blue : Colors.grey).marginOnly(right: kSpacing / 2),
          Expanded(child: Text(lastSender != null ? '$lastSender: $lastMessage' : lastMessage, softWrap: false, overflow: TextOverflow.ellipsis).textColor(Colors.grey)),
          if (unreadCount > 0)
            Badge(
              badgeColor: Colors.red,
              elevation: 0,
              padding: EdgeInsets.all(kSpacing * 0.5),
              badgeContent: Text(
                unreadCount.toString(),
                style: TextStyle(color: Colors.white),
              ),
            )
        ]).marginOnly(bottom: 10).border(bottom: 0.5, color: Colors.black12));
  }
}

final weekDays = <String>['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
String getTimeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);
  if (diff.inDays == 0)
    return DateFormat('hh:mma').format(date);
  else if (diff.inDays == 1)
    return 'Ayer';
  else if (diff.inDays < 7)
    return weekDays[date.weekday - 1];
  else
    return DateFormat('dd/MM/yy').format(date);
}
