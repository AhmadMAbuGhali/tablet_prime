import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tablet_prime/model/note_model.dart';

class DataProvider extends ChangeNotifier {

  TextEditingController noteController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final Database database;

  DataProvider(Database database) : this.database = database;

  Future<String> addNote(String title, String description) async {
    if(title==description){
    final note = Note(
      title: title,
      description: description,
    );
    final id = await database.insert(
      'Notes',
      note.toMap(excludeId: true),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('Note added with ID: $id');

    // Notify listeners that the data has changed
    notifyListeners();
    return "ok";
    }else{
      final note = Note(
          title: title,
          description: description,);
      final id = await database.insert(
        'Notes',
        note.toMap(excludeId: true),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      print('Note added with ID: $id');

      // Notify listeners that the data has changed
      notifyListeners();
      return "denid";
    }


  }

  Future<List<Note>> getAllNotes() async {
    final List<Map<String, dynamic>> maps = await database.query('Notes');
    return List.generate(maps.length, (index) {
      print(maps[index]);
      return Note.fromMap(maps[index]);
    });

  }

  Future<void> deleteNote(int id) async {
    // Delete the note with the specified ID
    await database.delete(
      'Notes',
      where: 'Id = ?',
      whereArgs: [id],
    );

    // Notify listeners that the data has changed
    notifyListeners();
  }



  Future<void> updateNote(int id, String newTitle, String newDescription) async {
    // Create a map of the updated values
    final updatedNote = {
      'Title': newTitle,
      'Description': newDescription,
    };

    // Update the note with the specified ID
    await database.update(
      'Notes',
      updatedNote,
      where: 'Id = ?',
      whereArgs: [id],
    );

    // Notify listeners that the data has changed
    notifyListeners();
  }
}
