import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xalo/pages/projects/project_controller.dart';

class ProjectPage extends GetView<ProjectController> {
  const ProjectPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('proyecto'),
      ),
    );
  }
}
