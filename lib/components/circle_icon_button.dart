import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({Key key, this.icon, this.backgroundColor, this.radius = 18, this.onTap, this.elevation = 0.0}) : super(key: key);
  final Icon icon;
  final Color backgroundColor;
  final double radius;
  final Function onTap;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          padding: EdgeInsets.all(kSpacing / 2),
          child: icon,
        ).ripple().clipRRect(all: radius).elevation(elevation).gestures(onTap: onTap));
  }
}
