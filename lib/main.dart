import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xalo/pages/wip_page.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:xalo/services/firebase_service.dart';
import 'package:xalo/services/session.dart';
import 'components/background/main_drawer.dart';
import 'app_routes.dart';
import 'app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

  runApp(Xalo());
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainDrawerController>(MainDrawerController(), permanent: true);
    Get.put<FirebaseService>(FirebaseService(), permanent: true);
  }
}

class Xalo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.main,
        getPages: AppRoutes.routes,
        initialBinding: MainBinding(),
        initialRoute: '/intro',
        unknownRoute: GetPage(name: '/wip', page: () => WipPage()),
        builder: (context, widget) => MainDrawer(controllerKey: MainDrawerController.to.drawerKey, child: widget),
        routingCallback: (routing) {
          if (Session.loggedAs != 'none') {
            if (!routing.current.contains('/main')) MainDrawerController.to.toggleNavigation(false);
            MainDrawerController.to.update();
          }
        },
      ),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
    );
  }
}
