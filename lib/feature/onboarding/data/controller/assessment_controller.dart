import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/onboarding/data/model/assessment_model.dart';
import 'package:intricate1/feature/onboarding/data/model/question_model.dart';
import 'package:intricate1/feature/onboarding/data/model/question_response_model.dart';
import 'package:intricate1/feature/onboarding/domain/usecases/assessment_data.dart';

class AssessmentController extends GetxController {
  late final List<QuestionModel> questions;
  final List<Map<String, String>> questionLists = [];

  var assessment = AssessmentModel(
    currentStep: 0,
    totalSteps: AssessmentData.questions.length,
    selectedAnswers: {},
  ).obs;

  @override
  void onInit() {
    super.onInit();
    questions = AssessmentData.questions;
  }

  void goToStep(int step) {
    assessment.update((val) {
      if (val != null && step >= 0 && step < val.totalSteps) {
        val.currentStep = step;
      }
    });
  }

  void resetAssessment() {
    assessment.update((val) {
      if (val != null) {
        val.currentStep = 0;
        val.selectedAnswers.clear();
      }
    });
    Get.until((route) => route.isFirst);
  }

  void updateAnswer(String questionId, String answerId, String question, String answer) {

    assessment.update((val) {
      if (val != null) {
        val.selectedAnswers[questionId] = answerId;
      }
    });

    questionLists.add({
      'question': question,
      'answer': answer,
    });

    debugPrint('📝 Total questions answered: ${questionLists.length}');
    for (final item in questionLists) {
      debugPrint('🔹 Q: ${item['question']}');
      debugPrint('   A: ${item['answer']}');
    }

  }

  void nextStep() {
    assessment.update((val) {
      if (val != null && val.currentStep < val.totalSteps - 1) {
        val.currentStep++;
      }
    });
  }

  void previousStep() {
    assessment.update((val) {
      if (val != null && val.currentStep > 0) {
        val.currentStep--;
      }
    });
  }

  String? getSelectedAnswer(String questionId) {
    return assessment.value.selectedAnswers[questionId];
  }
}
