// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tablet_prime/routes/route_helper.dart';
import 'package:tablet_prime/service/data_provider.dart';



class AddEditNote extends StatelessWidget {
   const AddEditNote({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(247, 250, 252, 1.0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(94, 114, 228, 1.0),
          elevation: 0.0,
          title: const Text('Add or edit a note'),
        ),
        body:Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
             children: [
               const Text('Title'),
               SizedBox(height: 10.h,),
               TextField(
                    keyboardType: TextInputType.text,
                 decoration: const InputDecoration(
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 1,

                         color:  Colors.red), //<-- SEE HERE
                   ),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 1,
                         color:  Colors.red),
                   ),),
                 controller: provider.noteController,

               ),
               SizedBox(height: 20.h,),
               const   Text('Description'),
               SizedBox(height: 10.h,),
               TextField(
                 decoration:const InputDecoration(
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                       width: 1,

                       color:  Colors.red), //<-- SEE HERE
                 ),
                 border: OutlineInputBorder(
                   borderSide: BorderSide(
                       width: 1,
                       color:  Colors.red),
                 ),),
                 controller: provider.descController,),
               SizedBox(height: 30.h,),
               ElevatedButton(
                 onPressed: () async {
                   final title = provider.noteController.text; // Get the title from a TextField
                   final description = provider.descController.text; // Get the description from another TextField

                   if(await provider.addNote(title, description)=="ok"){
                     Get.snackbar('Match', "title Match Desc");
                   } else{
                     Get.snackbar('dont Match', "title don't Match Desc");
                   }
                   provider.noteController.clear();
                   provider.descController.clear();

                   Get.offNamed(RouteHelper.home);


                 },
                 child:const Text("Submit"),
               ),


             ],
          ),


        )
    );});
  }

  bool isInteger(String string) {
    try {
      int.parse(string);
      return true;
    } on FormatException {
      return false;
    }
  }
}