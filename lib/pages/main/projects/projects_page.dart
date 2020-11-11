import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xalo/pages/main/projects/projects_controller.dart';

class ProjectsPage extends GetView<ProjectsController> {
  const ProjectsPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Proyectos')),
    );
  }
}
