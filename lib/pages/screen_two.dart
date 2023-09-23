import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../service/app_provider.dart';
import '../service/shared_preference_helper.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {


    return Consumer<AppProvider>(builder: (context, provider, x) {


      return  SafeArea(
        child: Scaffold(
        body: Column(
          children: [
            Center(
              child: provider.dataFromOne==null?Container():Text(provider.dataFromOne!.tr),
            ),

            ElevatedButton(onPressed: () async{
              final int? counter;
              counter  =  SharedPreferenceHelper(prefs: shaedpref).getCount();
              print(counter);

            }, child:  Text("get Number"))
          ],
        ),
    ),
      );});
  }
}
