import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  final int totalTime = 5 * 60;

  RxInt remainingTime = (5 * 60).obs;

  RxBool isRunning = false.obs;
  Timer? timer;

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer?.cancel();
        isRunning.value = false;
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

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
