
import 'package:get/get.dart';
import 'package:tablet_prime/pages/imagepaker.dart';
import 'package:tablet_prime/pages/note_app/add_edit.dart';
import 'package:tablet_prime/pages/note_app/home.dart';
import 'package:tablet_prime/pages/screen_one.dart';
import 'package:tablet_prime/pages/screen_two.dart';
import 'package:tablet_prime/pages/two.dart';

import '../pages/Switches.dart';
import '../pages/one.dart';

class RouteHelper {
  static const String one = "/one";
  static const String two = "/two";
  static const String home = "/home";
  static const String addEdie = "/addEdit";
  static const String switches = "/Switches";
  static const String screenOne = "/screenOne";
  static const String screenTwo = "/screenTwo";
  static const String imagePickers = "/imagePickers";
  static const String tabBarCustom = "/tabBarCustom";


  static String getOne() => '$one';
  static String getTwo() => '$two';
  static String getHome() => '$home';
  static String getAddEdit() => '$addEdie';
  static String getSwitches() => '$switches';
  static String getScreenOne() => '$screenOne';
  static String getScreenTwo() => '$screenTwo';
  static String getImagePickers() => '$imagePickers';
  static String getTabBarCustom() => '$tabBarCustom';

  static List<GetPage> routes = [
    GetPage(
      name: getOne(),
      page: () {
        return One();
      },
    ),
    GetPage(
      name: getAddEdit(),
      page: () {
        return AddEditNote();
      },
    ),
    GetPage(
      name: getHome(),
      page: () {
        return Home();
      },
    ),
    GetPage(
      name: getSwitches(),
      page: () {
        return Switches();
      },
    ),
    GetPage(
      name: getImagePickers(),
      page: () {
        return ImagePickers();
      },
    ),
    GetPage(
      name: getScreenOne(),
      page: () {
        return ScreenOne();
      },
    ),
    GetPage(
      name: getScreenTwo(),
      page: () {
        return ScreenTwo();
      },
    ),
    GetPage(
      name: two,
      page: () {
        return Two();
      },
    ),

  ];
}
