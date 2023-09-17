import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tablet_prime/pages/club_magazen.dart';
import 'package:tablet_prime/pages/one.dart';
import 'package:tablet_prime/resources/color_manager.dart';
import 'package:tablet_prime/routes/route_helper.dart';
import 'package:tablet_prime/service/app_provider.dart';

import 'locale/locale.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context, child) {
          return GetMaterialApp(
            locale: Get.deviceLocale,
            translations: MyLocale(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Tajawal',
              primaryColor: Color(0xFF8A57DC),
            ),
            initialRoute: RouteHelper.tabBarCustom,
            getPages: RouteHelper.routes,
          );
        });
  }
}


