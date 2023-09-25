import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tablet_prime/model/note_model.dart';
import 'package:tablet_prime/pages/note_app/sheraed/top_container.dart';
import 'package:tablet_prime/pages/note_app/update_note.dart';
import 'package:tablet_prime/resources/color_manager.dart';
import 'package:tablet_prime/routes/route_helper.dart';
import 'package:tablet_prime/service/data_provider.dart';

import '../../resources/assets_manager.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width;
    return Consumer<DataProvider>(
      builder: (context, provider, x) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(247, 250, 252, 1.0),
          body: Column(
            children: [
              TopContainer(
                height: 240,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 110.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.77,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor:
                            const Color.fromRGBO(251, 99, 64, 1.0),
                            backgroundColor:
                            const Color.fromRGBO(94, 114, 228, 1.0),
                            center: const CircleAvatar(
                              backgroundColor:
                              Color.fromRGBO(82, 95, 127, 1.0),
                              radius: 45.0,
                              backgroundImage: AssetImage(
                                ImageAssets.avatar,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: const Text(
                                  'Ahamd Abu Ghali',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Color.fromRGBO(247, 250, 252, 1.0),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const Text(
                                'Good software like good  food , takes time',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        subheading('My Tasks'),
                        GestureDetector(
                          onTap: () async {
                            Get.toNamed(RouteHelper.addEdie);
                          },
                          child: addIcon(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 500.h,
                  child: FutureBuilder<List<Note>>(
                    future: provider.getAllNotes(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                            if (kDebugMode) {
                              print('Error: ${snapshot.error}');
                            }
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final notes = snapshot.data;

                        if (notes == null || notes.isEmpty) {
                          return const Text('No notes available.');
                        }

                        return ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            final note = notes[index];
                            return Column(
                              children: [
                                Container(
                                  height: 60.h,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorManager.gray666,
                                    border: Border.all(width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          title: Text(note.title),
                                          subtitle: Text(note.description),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          final dataProvider =
                                          Provider.of<DataProvider>(
                                            context,
                                            listen: false,
                                          );
                                          final idToDelete =
                                              note.id; // Use the safe null-aware operator ?. to access id
                                          if (idToDelete != null) {
                                            if (kDebugMode) {
                                              print(
                                                "Deleting note with ID: $idToDelete");
                                            }
                                            await dataProvider
                                                .deleteNote(idToDelete);
                                          } else {
                                            // Handle the case where note is null

                                            if (kDebugMode) {
                                              print(
                                                "delete Failed: note is null ${note.id}");
                                            }
                                          }
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateNote(note: note),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.mode_edit),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static CircleAvatar addIcon() {
    return const CircleAvatar(
      radius: 25.0,
      backgroundColor: Color.fromRGBO(94, 114, 228, 1.0),
      child: Icon(
        Icons.add,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromRGBO(94, 114, 228, 1.0),
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}
