import 'package:get/get.dart';

class AdaptabilitySurveyController extends GetxController{
  var selectedOptionIndex = (-1).obs; // Initially no option is selected
  var currentQuestionIndex = 0.obs; // Keep track of current question

  // Method to update selected option
  void selectOption(int index) {
    selectedOptionIndex.value = index;
  }

  // Method to go to the next question
  void nextQuestion() {
    if (currentQuestionIndex.value < 4) {
      currentQuestionIndex.value++;
    }
  }

  // Reset selected option index when going to the next question
  void clearSelection() {
    selectedOptionIndex.value = -1;  // Reset the selected option for next question
  }
}