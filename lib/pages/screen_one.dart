import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tablet_prime/routes/route_helper.dart';

import '../inv.dart';
import '../main.dart';
import '../service/app_provider.dart';
import '../service/shared_preference_helper.dart';

class ScreenOne extends StatelessWidget {
  
  ScreenOne({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                    onPressed: () async {

                      await SharedPreferenceHelper(prefs: shaedpref).setCount(count: int.parse(controller.text));
                      provider.dataFromOne = controller.text;
                      await Get.toNamed(RouteHelper.screenTwo);
                    },
                    child: Text("Send")),
                Expanded(child: ListView.builder(
                    itemCount: provider.prime.length,
                    itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    width: 50,
                    color: Colors.red,
                    child: Center(
                      child: Text(provider.prime[index]),
                    ),
                  );
                }))
              ],
            ),
          ),
        ),
      );
    });
  }
}
