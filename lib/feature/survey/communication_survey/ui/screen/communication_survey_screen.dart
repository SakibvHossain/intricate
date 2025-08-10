import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/feature/survey/communication_survey/data/controller/communicatio_survey_controller.dart';
import 'package:get/get.dart';

class CommunicationSurveyScreen extends StatelessWidget {
  CommunicationSurveyScreen({super.key});

  List<Map<String, dynamic>> questions = [
    {
      'question': 'A classmate misquotes your brand concept in a group pitch.',
      'options': [
        'Clarify privately, then restate concept to team.',
        'Publicly correct the classmate mid-pitch for accuracy.',
        'Say nothing and hope the mistake goes unnoticed.',
        'Embarrass the classmate afterward for not listening.'
      ]
    },
    {
      'question': 'Client DM’s you slang you don’t understand.',
      'options': [
        'Ask for clarification and mirror their tone respectfully.',
        'Search online and guess meaning without asking.',
        'Reply with formal corporate jargon instead.',
        'Ignore the DM until someone else replies.'
      ]
    },
    {
      'question': 'Peer disagrees with your logo color choice in meeting.',
      'options': [
        'Acknowledge view, cite data, invite feedback.',
        'Let them have their way to avoid conflict.',
        "Defend your choice aggressively to prove you're right.",
        'Roll eyes and move on without addressing.'
      ]
    },
    {
      'question': 'Teacher praises you publicly; teammate looks upset.',
      'options': [
        'Thank teacher, redirect spotlight to team effort.',
        'Share credit privately after meeting.',
        "Accept praise and ignore teammate's feelings.",
        "Tell teacher teammate didn't contribute much."
      ]
    },
    {
      'question': 'Social post typo spotted after 500 views.',
      'options': [
        'Edit post quickly and add light apology comment.',
        'Delete post and re-upload corrected version.',
        'Ignore typos most people won’t notice.',
        'Blame teammate publicly for the typo.'
      ]
    }
  ];

  final CommunicationSurveyController controller =
      Get.put(CommunicationSurveyController());

  @override
  Widget build(BuildContext context) {
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
                        // Handle continue logic here
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
