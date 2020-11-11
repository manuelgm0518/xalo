import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key, this.selected}) : super(key: key);
  final String selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200'),
                radius: 40,
              ).center(),
              kSpacerH,
              Text('Nombre equisde', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(
                'Nivel (?',
                textAlign: TextAlign.left,
                style: TextStyle(color: kPrimaryColor),
              ),
            ],
          ).padding(all: kSpacing * 2),
        ),
        kSpacerH,
        navigationTile(MdiIcons.home, 'Inicio', selected: selected == 'feed', onTap: () => Get.offAndToNamed('/main/feed')),
        navigationTile(MdiIcons.forum, 'Mensajes', badgeCount: 17, selected: selected == 'inbox', onTap: () => Get.offAndToNamed('/main/inbox')),
        navigationTile(MdiIcons.briefcase, 'Jales', selected: selected == 'jales', onTap: () => Get.offAndToNamed('/main/jales')),
        navigationTile(MdiIcons.lightbulbOn, 'Proyectos', selected: selected == 'projects', onTap: () => Get.offAndToNamed('/main/projects')),
        navigationTile(MdiIcons.cog, 'Ajustes', selected: selected == 'settings', onTap: () => Get.toNamed('/settings')),
        Spacer(),
        Image.asset('assets/app/xalo_logotype_white.png', height: 70).gestures(onTap: () => Get.toNamed('/info')),
      ],
    );
  }
}

Widget navigationTile(IconData icon, String text, {int badgeCount, bool selected = false, Function onTap}) {
  final color = selected ? Colors.white : Colors.white54;
  return ListTile(
    onTap: onTap,
    shape: RoundedRectangleBorder(borderRadius: kCircular),
    leading: Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      child: Styled.icon(icon, color: color, animate: true).scale(all: selected ? 1.4 : 1, animate: true).animate(Duration(milliseconds: 500), Curves.elasticInOut),
    ),
    title: Text(text, style: TextStyle(color: color, fontWeight: selected ? FontWeight.bold : FontWeight.normal)),
    trailing: (badgeCount ?? 0) > 0 ? Badge(badgeContent: Text(badgeCount.toString(), style: TextStyle(color: Colors.white)), elevation: 0) : null,
  );
}
