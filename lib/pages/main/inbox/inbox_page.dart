import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'inbox_controller.dart';

class InboxPage extends GetView<InboxController> {
  const InboxPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Inbox')),
    );
  }
}
