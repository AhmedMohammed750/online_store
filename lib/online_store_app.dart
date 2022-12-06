// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store_app/data/firebase.dart';
import 'package:online_store_app/presentation/screens/admin_screen.dart';
import 'package:online_store_app/presentation/screens/home_screen.dart';
import 'package:online_store_app/presentation/widgets/themes.dart';
import 'package:sizer/sizer.dart';

// Controllers
import 'package:online_store_app/presentation/controllers/locale/locale_controller.dart';
import 'package:online_store_app/presentation/controllers/locale/locale.dart';

// Screens
import 'package:online_store_app/presentation/screens/welcome/login_screen.dart';








class OnlineStoreApp extends StatelessWidget {
  const OnlineStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController()); // Provide Instance of LocaleController

    return Sizer(builder: (context, orientation, deviceType) {
       
      return GetMaterialApp(
        theme: ThemeService().lightTheme,
        darkTheme: ThemeService().darkTheme,
        themeMode: ThemeService().getThemeMode(),


        locale: Get.deviceLocale,
        translations: Locale(),
        debugShowCheckedModeBanner: false,

        home:islogin==false ?LoginScreen():HomeScreen(),
      );
    });
  }
}
