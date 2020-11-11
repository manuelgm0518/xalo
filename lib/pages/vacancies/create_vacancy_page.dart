import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xalo/pages/vacancies/create_vacancy_controller.dart';

class CreateVacancyPage extends GetView<CreateVacancyController> {
  const CreateVacancyPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Crear Vacante'),
    );
  }
}
