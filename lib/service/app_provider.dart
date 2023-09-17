import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  int data = 0;

  addOntToData(){
    data +=1;
    notifyListeners();
  }
  File? imageFile;


  Future _getFromCamera() async {

    final _picker = ImagePicker();


    PickedFile? pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      imageFile = imageTemp;
    }
    notifyListeners();
  }

  openCamera(BuildContext context) async {
    await _getFromCamera();
    Navigator.pop(context);
    notifyListeners();

  }

  openGallery(BuildContext context) async{
    await  _getFromGallery();
    Navigator.pop(context);
    notifyListeners();

  }
  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      imageFile = imageTemp;
      notifyListeners();

    }
    notifyListeners();

  }
  Widget bottmSheet(BuildContext context){
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(60))),
      height: 220,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'changePhoto',
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Text("openCamera"),

            onPressed: () { openCamera(context); },),
          SizedBox(
            height: 10,
          ),
          Text("or"),
          ElevatedButton(
            child: Text("openCamera"),

            onPressed: () { openGallery(context); },),
        ],
      ),
    );

  }


}
