import 'dart:async';
import 'package:get/get.dart';
import 'package:intricate1/feature/notes/data/controller/note_controller.dart';
import 'package:intricate1/feature/notes/ui/screens/note_history_page.dart';

class TimerController extends GetxController {
  final int totalTime = 1 * 60;

  RxInt remainingTime = (1 * 60).obs;
  RxBool isRunning = false.obs;
  Timer? timer;

  // Inject NoteController
  final noteController = Get.find<NoteController>();

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer?.cancel();
        isRunning.value = false;

        // Add note when timer completes
        _addTimerNote();
      }
    });

    isRunning.value = true;
  }

  void pauseTimer() {
    timer?.cancel();
    isRunning.value = false;
  }

  void resetTimer() {
    timer?.cancel();
    remainingTime.value = totalTime;
    isRunning.value = false;
  }

  void clearTimer() {
    timer?.cancel();
    remainingTime.value = totalTime;
    isRunning.value = false;
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void _addTimerNote() async {
    final now = DateTime.now();
    await noteController.createNote(
      title: 'Timer Completed',
      content: '5-minute timer completed at ${now.hour}:${now.minute}',
    );
    // Optionally, navigate to NoteHistoryPage
    Get.to(() => NoteHistoryPage());
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
