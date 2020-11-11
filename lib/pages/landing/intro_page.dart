import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:xalo/app_themes.dart';
import 'package:xalo/services/session.dart';
import 'intro_controller.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final slides = [
      new Slide(
        title: "¿Le jalas al jale?".toUpperCase(),
        description: "Xalo es una plataforma interactiva donde proliferan los trabajos, la participación y la búsqueda de talento",
        pathImage: "assets/app/xalo_splash_white.png",
        styleTitle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 30),
        styleDescription: TextStyle(color: Colors.black38, fontSize: 20),
        maxLineTitle: 2,
        backgroundColor: Colors.white,
      ),
      new Slide(
        title: "¡Logro desbloqueado!".toUpperCase(),
        description: "Nosotros armaremos tu propio currículum con los logros que vayas acumulando a lo largo de tu carrera laboral",
        pathImage: "assets/intro_1.png",
        styleTitle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 30),
        styleDescription: TextStyle(color: Colors.black38, fontSize: 20),
        maxLineTitle: 2,
        backgroundColor: Colors.white,
      ),
      new Slide(
        title: "Unidos es mejor".toUpperCase(),
        description: "Aquí encontrarás proyectos en los que te podrás unir como Freelance o crear propios con el apadrinamiento de una empresa",
        pathImage: "assets/intro_2.png",
        styleTitle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 30),
        styleDescription: TextStyle(color: Colors.black38, fontSize: 20),
        maxLineTitle: 2,
        backgroundColor: Colors.white,
      ),
      new Slide(
        title: "¡Siempre adelante!".toUpperCase(),
        description: "Te brindaremos recomendaciones basadas en las tendencias de las empresas para que siempre estés al día en el mercado laboral",
        pathImage: "assets/intro_3.png",
        styleTitle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 30),
        styleDescription: TextStyle(color: Colors.black38, fontSize: 20),
        backgroundColor: Colors.white,
        maxLineTitle: 2,
      ),
      new Slide(
        title: "Al grano...".toUpperCase(),
        description: "Menos formalidades y más jale. Agilizamos lo máximo posible la vinculación entre empresas y talentos",
        pathImage: "assets/intro_4.png",
        styleTitle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 30),
        styleDescription: TextStyle(color: Colors.black38, fontSize: 20),
        backgroundColor: Colors.white,
        maxLineTitle: 2,
      )
    ];
    return Scaffold(
      body: IntroSlider(
        slides: slides,
        colorActiveDot: kPrimaryColor,
        colorDot: Colors.black12,
        colorDoneBtn: kPrimaryColor,
        renderNextBtn: Icon(Icons.navigate_next, color: Colors.white, size: 35.0),
        renderDoneBtn: Icon(Icons.done, color: Colors.white, size: 35.0),
        renderSkipBtn: Icon(Icons.skip_next, color: kPrimaryColor, size: 35.0),
        renderPrevBtn: Icon(Icons.skip_previous, color: Colors.white, size: 35.0),
        onDonePress: () {
          Session.loggedAs = 'user';
          Get.offAndToNamed('/main/feed');
        },
      ),
    );
  }
}
