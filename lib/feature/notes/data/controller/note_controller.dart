import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intricate1/feature/notes/data/model/note_model.dart';
import 'package:intricate1/feature/notes/data/model/timer_note_model.dart';
import 'package:intricate1/feature/notes/ui/screens/note_history_page.dart';
import 'package:logger/logger.dart';

class NoteController extends GetxController {
  var isLoading = false.obs;
  var note = Rx<NoteModel?>(null);
  var notes = <NoteModel>[].obs;
  RxList<TimerNoteModel> timernote = <TimerNoteModel>[].obs;

  var errorMessage = "".obs;

  final String baseUrl = 'http://172.252.13.71:5001/api/v1/notes';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNtZWkzNXd2NzAwMDB5a3Jtb3ppejRkNnIiLCJmdWxsTmFtZSI6IlJhbmEgU2hlaWtoIiwiZW1haWwiOiJyYW5hNjQyNHNoZWlraEBnbWFpbC5jb20iLCJtb2JpbGVOdW1iZXIiOiIwMTYxMzQ3NTg3MSIsInByb2ZpbGVQaWMiOiIiLCJyb2xlIjoiVVNFUiIsImlzVmVyaWZpZWQiOnRydWUsImlhdCI6MTc1NTU4MzYxMSwiZXhwIjoxODE4Njk4ODExfQ.8XIFPa1ZqfR9m2t7sWrMb-R0aE218LeN53RRxG-OCbg';

  // Logger
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  @override
  void onInit() {
    fetchNotes();
    super.onInit();
  }

  /// ✅ Validates input, creates a note, and shows snackbars
  Future<void> validateAndCreateNote({
    required String title,
    required String description,
  }) async {
    // Validation
    if (title.trim().isEmpty) {
      errorMessage.value = "Title cannot be empty";
      Get.snackbar(
        'Error',
        errorMessage.value,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (description.trim().isEmpty) {
      errorMessage.value = 'Description cannot be empty';
      Get.snackbar(
        'Error',
        errorMessage.value,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // Create note
    await createNote(title: title.trim(), content: description.trim());

    // Show result
    if (note.value != null) {
      Get.snackbar(
        'Success',
        'Note created successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } else if (errorMessage.value.isNotEmpty) {
      Get.snackbar(
        'Error',
        errorMessage.value,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // Create a note (API call)
  Future<void> createNote({
    required String title,
    required String content,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';
    final url = Uri.parse('$baseUrl/create-note');

    _logger.i('Creating note with title: $title');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode({'title': title, 'content': content}),
      );

      _logger.d('Response status: ${response.statusCode}');
      _logger.d('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.to(NoteHistoryPage());
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          note.value = NoteModel.fromJson(data['data']);
          _logger.i('✅ Note created successfully: ${note.value!.id}');
          await fetchNotes(); // refresh notes
        } else {
          errorMessage.value = data['message'] ?? 'Unknown error';
          _logger.w('⚠️ Create note failed: ${errorMessage.value}');
        }
      } else {
        errorMessage.value =
        'Failed to create note. Status code: ${response.statusCode}';
        _logger.e(errorMessage.value);
      }
    } catch (e, s) {
      errorMessage.value = 'Error: $e';
      _logger.e('Exception while creating note', error: e, stackTrace: s);
    } finally {
      isLoading.value = false;
    }
  }

  void addNote({
    required String title,
    required String content,
    required DateTime createdAt,
  }) {
    final note = TimerNoteModel(
      title: title,
      content: content,
      createdAt: createdAt,
    );

    timernote.add(note);
  }

  // Fetch all notes
  Future<void> fetchNotes() async {
    isLoading.value = true;
    errorMessage.value = "";
    final url = Uri.parse('$baseUrl/my-notes');

    _logger.i('Fetching all notes');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      _logger.d("Response status: ${response.statusCode}");
      _logger.d("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          final List<dynamic> notesData = data['data'];
          notes.value = notesData.map((e) => NoteModel.fromJson(e)).toList();
          _logger.i("✅ Notes fetched: ${notes.length}");
        } else {
          errorMessage.value = data['message'] ?? "Unknown error";
          _logger.w("⚠️ Fetch notes failed: ${errorMessage.value}");
        }
      } else {
        errorMessage.value =
        "Failed to fetch notes. Status code: ${response.statusCode}";
        _logger.e(errorMessage.value);
      }
    } catch (e, s) {
      errorMessage.value = "Error: $e";
      _logger.e("Exception while fetching notes", error: e, stackTrace: s);
    } finally {
      isLoading.value = false;
    }
  }
}
