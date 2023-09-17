import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../service/app_provider.dart';

class ImagePickers extends StatelessWidget {
  const ImagePickers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Cam")),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) => provider.bottmSheet(context),
                    );

                    print(provider.imageFile!.path);
                  },
                  child: Text("div")),
              Container(
                child: provider.imageFile == null ? Container() : Image.file(provider.imageFile!),
              )
            ],
          ),
        ),
      );
    });
  }
}
