import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:xalo/components/vacancy_card.dart';

class FeedController extends GetxController {
  @override
  void onInit() {
    _scrollListener();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (feed.length < 10) addItem();
    });
    //addItem();
    //addItem();
    super.onInit();
  }

  //SCROLL
  final scroll = ScrollController();
  var openFAB = false.obs;
  var visibleFAB = true.obs;
  void _scrollListener() {
    scroll.addListener(() {
      if (scroll.position.userScrollDirection == ScrollDirection.reverse) visibleFAB.value = false;
      if (scroll.position.userScrollDirection == ScrollDirection.forward) visibleFAB.value = true;
    });
  }

  //FEED
  final listKey = GlobalKey<SliverAnimatedListState>();
  var feed = <VacancyCard>[];

  var companies = <String, String>{
    'Google': 'https://blog.hubspot.com/hubfs/image8-2.jpg',
    'Rookie Roosters':
        'https://firebasestorage.googleapis.com/v0/b/xalo-a72ee.appspot.com/o/companies%2FGsrx6svbuo38HyUPEr6B%2FRookieRoosters2.png?alt=media&token=7aa2c7ac-79c7-42a0-826c-0466fb698300',
    'Microsoft': 'https://onedigital.mx/ww3/wp-content/uploads/2015/09/microsoft-logo.jpg',
    'Apple': 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/505px-Apple_logo_black.svg.png',
    'FX Group': 'https://media-exp1.licdn.com/dms/image/C510BAQEaCDKxNcinjQ/company-logo_200_200/0?e=1613001600&v=beta&t=iuLt5hEiAWbb1pO9m_yI3T5L0RdsEtYEZABOYwKjRzg',
  };
  var locations = ['Aguascalientes', 'Jalisco', 'Ciudad de México', 'Guanajuato', 'Zacatecas'];
  var jobs = ['Desarrollador backend', 'Desarrollador frontend', 'Desarrollador fullstack', 'Desarrollador móvil', 'Desarrollador C# junior', 'Desarrollador Java senior'];

  void addItem() {
    final index = feed.length;
    final company = companies.keys.elementAt(Random().nextInt(4));
    final location = locations[Random().nextInt(4)];
    final daysAgo = 2 + Random().nextInt(4);
    final job = jobs[Random().nextInt(5)];
    feed.add(VacancyCard(icon: companies[company], company: company, location: '$location, México', timeAgo: '$daysAgo días', job: job));
    listKey.currentState.insertItem(index);
  }
}
