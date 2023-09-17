import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:tablet_prime/resources/styles_manager.dart';

import '../service/app_provider.dart';

class Two extends StatelessWidget {
  const Two({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(
              "${provider.data}",
              style: getPrimaryStyle(),
            ),
            ElevatedButton(
                onPressed: () {
                 provider.addOntToData();
                },
                child: Text("Add 1")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("one"))
          ],
        ),
      );
    });
  }
}
