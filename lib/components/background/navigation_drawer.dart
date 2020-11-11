import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';
import 'package:xalo/components/background/main_drawer.dart';

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
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/xalo-a72ee.appspot.com/o/talents%2FPCUrSrOlAuuxOmHvtZRI%2FManuel%20Gonz%C3%A1lez%20Mart%C3%ADnez%20351%20(1).jpg?alt=media&token=62c9a3ee-0be2-4338-9287-3d4b5c8fc029'),
                radius: 40,
              ).center(),
              kSpacerH,
              Text('Manuel González', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(
                'Desarrollador Móvil',
                textAlign: TextAlign.left,
                style: TextStyle(color: kPrimaryColor),
              ),
            ],
          ).padding(all: kSpacing * 2),
        ).gestures(onTap: () => Get.toNamed('/profile')),
        kSpacerH,
        navigationTile(MdiIcons.home, 'Inicio', selected: selected == 'feed', onTap: () async {
          await Get.offAndToNamed('/main/feed');
          await Future.delayed(Duration(milliseconds: 400));
          MainDrawerController.to.toggleNavigation(false);
        }),
        navigationTile(MdiIcons.forum, 'Mensajes', badgeCount: 17, selected: selected == 'inbox', onTap: () async {
          await Get.offAndToNamed('/main/inbox');
          await Future.delayed(Duration(milliseconds: 400));
          MainDrawerController.to.toggleNavigation(false);
        }),
        navigationTile(MdiIcons.briefcase, 'Jales', selected: selected == 'jales', onTap: () async {
          await Get.offAndToNamed('/main/jales');
          await Future.delayed(Duration(milliseconds: 400));
          MainDrawerController.to.toggleNavigation(false);
        }),
        navigationTile(MdiIcons.lightbulbOn, 'Proyectos', selected: selected == 'projects', onTap: () async {
          await Get.offAndToNamed('/main/projects');
          await Future.delayed(Duration(milliseconds: 400));
          MainDrawerController.to.toggleNavigation(false);
        }),
        Spacer(),
        Row(children: [
          Image.asset('assets/app/xalo_logotype_white.png', height: 50).gestures(onTap: () => Get.toNamed('/info')),
          Spacer(),
          Container(height: 40, width: 2, color: Colors.white24),
          kSpacerW,
          IconButton(icon: Icon(MdiIcons.cog, size: 35, color: Colors.white54), onPressed: () => Get.toNamed('/settings')),
        ]).paddingSymmetric(horizontal: kSpacing * 2),
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
