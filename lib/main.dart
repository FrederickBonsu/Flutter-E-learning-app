// @dart=2.9



import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:adessua/controllers/controllers.dart';
import 'package:adessua/constants/constants.dart';
import 'package:adessua/ui/components/components.dart';
import 'package:adessua/helpers/helpers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';








void main() async {



  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());




  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  // static final String = 'Adessua';


  @override
  Widget build(BuildContext context) {

    ThemeController.to.getThemeModeFromStore();
    return


    GetBuilder<LanguageController>(
      builder: (languageController) => Loading(
        child: GetMaterialApp(
          builder: EasyLoading.init(),
          translations: Localization(),
          locale: languageController.getLocale, // <- Current locale


          debugShowCheckedModeBanner: false,

          //defaultTransition: Transition.fade,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,

          initialRoute: "/",
          getPages: AppRoutes.routes,
        ),

      ),);


  }
}
