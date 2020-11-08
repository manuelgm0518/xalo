import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:velocity_x/velocity_x.dart';
import 'config/app_routes.dart';
import 'config/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Vx.isWeb) await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //await Firebase.initializeApp();
  runApp(Xalo());
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put<FirebaseService>(FirebaseService(), permanent: true);
  }
}

class Xalo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.mainLight,
        getPages: AppRoutes.routes,
        initialBinding: MainBinding(),
        initialRoute: '/',
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
