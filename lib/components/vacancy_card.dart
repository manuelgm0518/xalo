import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';
import 'package:xalo/models/Vacancy.dart';

class VacancyCard extends StatelessWidget {
  const VacancyCard({Key key, this.icon, this.company, this.location, this.timeAgo, this.job}) : super(key: key);
  final String icon;
  final String company;
  final String location;
  final String timeAgo;
  final String job;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [CircleAvatar(backgroundImage: NetworkImage(icon)), kSpacerH, Text(timeAgo).textColor(Colors.grey)]),
        kSpacerW,
        kSpacerW,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(company, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, color: kPrimaryColor)),
            Text(location, textAlign: TextAlign.left, style: TextStyle(color: Colors.grey)),
          ],
        ))
      ],
    ).padding(all: kSpacing * 2));
  }
}
