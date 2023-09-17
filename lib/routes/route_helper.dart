
import 'package:get/get.dart';
import 'package:tablet_prime/pages/imagepaker.dart';
import 'package:tablet_prime/pages/two.dart';

import '../pages/one.dart';

class RouteHelper {
  static const String one = "/one";
  static const String two = "/two";
  static const String imagePickers = "/imagePickers";
  static const String tabBarCustom = "/tabBarCustom";


  static String getOne() => '$one';
  static String getTwo() => '$two';
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
      name: getImagePickers(),
      page: () {
        return ImagePickers();
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
