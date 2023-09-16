
import 'package:get/get.dart';
import 'package:tablet_prime/pages/two.dart';

import '../pages/one.dart';

class RouteHelper {
  static const String one = "/one";
  static const String two = "/two";


  static String getOne() => '$one';
  static String getTwo() => '$two';

  static List<GetPage> routes = [
    GetPage(
      name: one,
      page: () {
        return One();
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
