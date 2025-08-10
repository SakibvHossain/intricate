import 'package:get/get.dart';
import 'package:intricate1/feature/notes/data/model/note_model.dart';

class NoteController extends GetxController {
  var notes = <NoteModel>[].obs;

  void addNote(String title, String description, String date) {
    notes.add(NoteModel(title: title, description: description, date: date));
  }
}
