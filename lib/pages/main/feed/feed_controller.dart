import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  @override
  void onInit() {
    _scrollListener();
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
  var items = ['oa', 'saludos', 'jsjsjjs', 'oa', 'saludos', 'jsjsjjs', 'oa', 'saludos', 'jsjsjjs', 'oa', 'saludos', 'jsjsjjs'];
  void addItem() {
    final index = items.length;
    items.add('desgtrght $index');
    listKey.currentState.insertItem(index);
  }
}
