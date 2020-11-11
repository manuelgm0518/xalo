import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:xalo/app_themes.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Notificaciones', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
        kSpacerH,
        Container(
            decoration: BoxDecoration(
              borderRadius: kCircular,
              color: Colors.white12,
            ),
            child: ListTile(
              onTap: () {},

              shape: RoundedRectangleBorder(borderRadius: kCircular),
              //leading: Icon(MdiIcons.message),
              title: Text('Bienvenido a Xalo!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('Hace 1 min', style: TextStyle(color: Colors.white)),
            )),
        Spacer()
      ],
    );
  }
}
