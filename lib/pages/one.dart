import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:tablet_prime/pages/club_magazen.dart';
import 'package:tablet_prime/pages/two.dart';
import 'package:tablet_prime/routes/route_helper.dart';

import '../resources/assets_manager.dart';
import '../resources/styles_manager.dart';


class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Image.asset(ImageAssets.logopng),
          SizedBox(height: 50.h,),
          Text("login".tr,style: getPrimaryStyle(),),
      ElevatedButton(onPressed: (){
Get.toNamed(RouteHelper.two);
      }, child: Text("Hdsfasfas"))
        ],
      ),
    );
  }
}
