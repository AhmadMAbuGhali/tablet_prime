import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tablet_prime/model/note_model.dart';
import 'package:tablet_prime/service/data_provider.dart';

class UpdateNote extends StatelessWidget {
  final Note note;

  const UpdateNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
    TextEditingController(text: note.title);
    TextEditingController descriptionController =
    TextEditingController(text: note.description);

    String updatedTitle = note.title;
    String updatedDescription = note.description;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Title'),
            SizedBox(height: 10.h),
            TextField(
              controller: titleController,
              decoration:const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.red,
                  ),
                ),
              ),
              onChanged: (value) {
                updatedTitle = value;
              },
            ),
            SizedBox(height: 20.h),
          const  Text('Description'),
            SizedBox(height: 10.h),
            TextField(
              controller: descriptionController,
              decoration:const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.red,
                  ),
                ),
              ),
              onChanged: (value) {
                updatedDescription = value;
              },
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () async {
                final dataProvider = Provider.of<DataProvider>(context, listen: false);

                // Call the updateNote method from the DataProvider
                await dataProvider.updateNote(
                  note.id!,
                  updatedTitle,
                  updatedDescription,
                );

                // Navigate back to the previous screen (e.g., the details screen)
               Get.back();
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
