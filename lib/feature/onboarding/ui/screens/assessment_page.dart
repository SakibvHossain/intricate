import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/utils/app_colors.dart';
import 'package:intricate1/feature/onboarding/bindings/survey_controller.dart';
import 'package:intricate1/feature/onboarding/data/controller/assessment_controller.dart';
import 'package:intricate1/feature/onboarding/data/model/question_model.dart';
import 'package:intricate1/feature/onboarding/data/model/question_option_model.dart';
import 'package:intricate1/feature/onboarding/ui/screens/progress_indicator.dart';
import 'package:intricate1/feature/onboarding/ui/screens/ready_plan.dart';
import 'package:intricate1/widgets/button/custom_button.dart';
import 'package:logger/logger.dart';

class AssessmentPage extends StatelessWidget {
  AssessmentPage({super.key});

  final controller = Get.put(AssessmentController());
  final surveyController = Get.put(SurveyController());
  final _pageController = PageController();
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(() {
        final currentStep = controller.assessment.value.currentStep;
        final totalSteps = controller.assessment.value.totalSteps;
        // final question = controller.questions[currentStep];

        return SafeArea(
          child: Column(
            children: [
              //* Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: AssessmentProgressIndicator(
                  currentStep: currentStep + 1,
                  totalSteps: controller.assessment.value.totalSteps,
                  onBackPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    controller.previousStep();
                  },
                ),
              ),

              // Question Area
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller.questions
                      .map((q) => _buildQuestionStep(q))
                      .toList(),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16.w),
                child: Obx(() => surveyController.isLoading.value ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: SpinKitDoubleBounce(
                      duration: Duration(seconds: 2),
                      size: 28,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ) : CustomButton(
                  borderRadius: 8.r,
                  text: currentStep < totalSteps - 1
                      ? 'Next'
                      : 'Generate My Routine',
                  onTap: () async {
                    //* Check if an answer is selected for the current question
                    final currentQuestion = controller.questions[currentStep];
                    final isAnswerSelected = controller.getSelectedAnswer(currentQuestion.id) != null;

                    // debugPrint('++++++++++++++++++++++++++++++++++++++${currentQuestion.title}');
                    // debugPrint('++++++++++++++++Answer++++++++++++++++++++++${controller.assessment.value.selectedAnswers}');

                    if (currentStep < totalSteps - 1) {
                      if (isAnswerSelected) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        controller.nextStep();
                      } else {
                        Get.snackbar(
                          'Selection Required',
                          'Please select an option before proceeding.',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    } else {
                      if (isAnswerSelected) {
                        await surveyController.surveyResponse();
                        Get.snackbar(
                          'Success',
                          'Assessment plan is ready!',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      } else {
                        Get.snackbar(
                          'Selection Required',
                          'Please select an option to generate your routine.',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    }
                  },
                )),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildQuestionStep(QuestionModel question) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.title,
            style: Get.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.subtitle,
            style: Get.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: question.options.map((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildOptionCard(question: question, option: option),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required QuestionModel question,
    required QuestionOption option,
  }) {
    return Obx(() {
      final isSelected = controller.getSelectedAnswer(question.id) == option.id;

      return SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            controller.updateAnswer(question.id, option.id, question.title, option.title);
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFA8D5BA) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  option.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
