import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tablet_prime/pages/club_magazen.dart';
import 'package:tablet_prime/pages/one.dart';
import 'package:tablet_prime/resources/color_manager.dart';
import 'package:tablet_prime/routes/route_helper.dart';
import 'package:tablet_prime/service/app_provider.dart';
import 'package:tablet_prime/service/sqlite_service.dart';

import 'locale/locale.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

late SharedPreferences shaedpref;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  shaedpref = await SharedPreferences.getInstance();
  final prefs = await SharedPreferences.getInstance();
  final db = await SqliteService.initizateDb();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromRGBO(94, 114, 228, 1.0),
    statusBarColor: Color.fromRGBO(94, 114, 228, 1.0),
  ));
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
            locale: shaedpref.getString("curruntLang") == null
                ? Get.deviceLocale
                : Locale(shaedpref.getString("curruntLang")!),
            translations: MyLocale(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Tajawal',
              primaryColor: Color(0xFF8A57DC),
            ),
            initialRoute: RouteHelper.screenOne,
            getPages: RouteHelper.routes,
          );
        });
  }
}


