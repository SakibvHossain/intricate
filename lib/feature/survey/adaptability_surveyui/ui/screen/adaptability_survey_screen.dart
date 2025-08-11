import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/feature/define_your_path/ui/question_screen.dart';
import 'package:intricate1/feature/survey/adaptability_surveyui/data/controller/adaptability_survey_controller.dart';

class AdaptabilitySurveyScreen extends StatelessWidget {
  AdaptabilitySurveyScreen({super.key});
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Algorithm update halves post reach overnight.',
      'options': [
        'Test two new formats today and track results.',
        'Wait a week; algorithm may revert.',
        'Delete underperforming posts immediately.',
        'Complain online that the algorithm is unfair.'
      ]
    },
    {
      'question': 'Rehearsal venue suddenly unavailable.',
      'options': [
        'Secure virtual run-through and adjust slide timings.',
        'Postpone rehearsal until venue reopens.',
        'Cancel rehearsal and trust presenters.',
        'Blame organizer publicly for bad planning.'
      ]
    },
    {
      'question': 'Trend you planned for is already passé.',
      'options': [
        'Post message to emerging micro-trend insights.',
        'Proceed with original plan; audience won’t notice.',
        'Scrap campaign entirely, start from scratch.',
        'Blame client for slow approvals.'
      ]
    },
    {
      'question': 'Wi-Fi drops during live stream.',
      'options': [
        'Switch to phone hotspot and continue calmly.',
        'Pause stream and wait for Wi-Fi to return.',
        'End stream abruptly with apology.',
        'Shout at tech team on camera.'
      ]
    },
    {
      'question': 'Feedback contradicts your original brief.',
      'options': [
        'Pause, ask probing questions, iterate design quickly.',
        'Explain why feedback is wrong and reject changes.',
        'Ignore feedback and proceed with original design.',
        'Complain to peers about confusing feedback.'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    final AdaptabilitySurveyController controller =
        Get.put(AdaptabilitySurveyController());
    final size = MediaQuery.of(context).size;
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.1),

                // Display Question Number
                Obx(() {
                  return Text(
                    'Question: ${controller.currentQuestionIndex.value + 1}',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffFCFCFC)),
                  );
                }),
                SizedBox(height: 12.h),

                // Display Question Text
                Obx(() {
                  final currentQuestionIndex =
                      controller.currentQuestionIndex.value;
                  return Text(
                    questions[currentQuestionIndex]['question'],
                    style: TextStyle(
                        fontSize: 28.sp, color: const Color(0xffFCFCFC)),
                  );
                }),

                SizedBox(height: 16.h),

                // Display Options List
                Obx(() {
                  final currentQuestionIndex =
                      controller.currentQuestionIndex.value;
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      bool isSelected =
                          controller.selectedOptionIndex.value == index;
                      return GestureDetector(
                        onTap: () {
                          controller.selectOption(index); // Select the option
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.r),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Color(0x1F00D700) : Colors.white10,
                            borderRadius: BorderRadius.circular(8.r),
                            border: isSelected
                                ? Border.all(color: Color(0xFF00D700))
                                : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions[currentQuestionIndex]['options'][index],
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xffFCFCFC)),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount:
                        questions[currentQuestionIndex]['options'].length,
                  );
                }),

                SizedBox(height: 16.h),

                // Display Next or Continue Button
                Obx(() {
                  final currentQuestionIndex =
                      controller.currentQuestionIndex.value;
                  return ComponentCustomButton(
                    text: currentQuestionIndex == questions.length - 1
                        ? 'Continue'
                        : 'Next',
                    gradientColors: [Color(0xff7EB243), Color(0xff024015)],
                    onTap: () {
                      if (currentQuestionIndex < questions.length - 1) {
                        controller.nextQuestion(); // Move to the next question
                        controller
                            .clearSelection(); // Clear selected option for next question
                      } else {
                        Get.to(()=>TextQuestionScreen());
                      }
                    },
                  );
                }),

                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
