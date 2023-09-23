import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/app_provider.dart';

class Switches extends StatelessWidget {
  const Switches({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Switch"),
        ),
        body: Column(
          children: [
           provider.isSwitched?
           Switch(
                value: provider.isSwitched,
                onChanged: (value) {
                  provider.changeValue(value);
                }):provider.data.toString().isNotEmpty ?Container():Container()
          ],
        ),
      );
    });
  }
}
