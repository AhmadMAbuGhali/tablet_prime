import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Two extends StatelessWidget {
  const Two({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.back();
          }, child: Text("one"))
        ],
      ),
    );
  }
}
