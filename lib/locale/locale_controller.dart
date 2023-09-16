import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';


import '../main.dart';


class MyLocalController extends GetxController{


  Locale? intalLang ;

  void changLocal(String codeLang) async{
    Locale locale = new Locale(codeLang);


        Get.updateLocale(locale);
  }

}