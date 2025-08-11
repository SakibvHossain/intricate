import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_background.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/feature/define_your_path/ui/question_screen.dart';
import 'package:intricate1/feature/survey/leadership_survey/data/controller/leadership_survey_controller.dart';

class LeadershipSurveyScreen extends StatelessWidget {
  LeadershipSurveyScreen({super.key});

  List<Map<String, dynamic>> questions = [
    {
      'question': 'Team stuck choosing slogan; deadline 1 hr.',
      'options': [
        'Facilitate quick vote after summarizing options.',
        'Choose your favorite slogan unilaterally.',
        'Ask teacher for an extension rather than decide.',
        'Give up and tell team it’s impossible.'
      ]
    },
    {
      'question': 'New member shy during brainstorming.',
      'options': [
        'Assign them a low-risk idea to share first.',
        'Ask them to observe and take notes only.',
        'Ignore them; they’ll speak up if they want.',
        'Tell them to talk more or leave the group.'
      ]
    },
    {
      'question': 'Budget cuts threaten campaign scope.',
      'options': [
        'Re-prioritize goals and negotiate must-keep elements.',
        'Reduce quality of all deliverables evenly.',
        'Cancel the project until funds return.',
        'Complain loudly about unfair budget cuts.'
      ]
    },
    {
      'question': 'Two peers argue over font size.',
      'options': [
        'Mediate by linking decision to target audience needs.',
        'Let majority opinion win without discussion.',
        'Choose whichever peer is your friend.',
        'Tell them to stop arguing and pick any size.'
      ]
    },
    {
      'question': 'Mentor offers you solo credit.',
      'options': [
        'Accept graciously and highlight team contributions.',
        'Accept credit quietly without mentioning team.',
        'Refuse credit because team not included.',
        'Boast publicly that success was all yours.'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    final LeadershipSurveyController controller =
        Get.put(LeadershipSurveyController());
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
                        Get.to(() => TextQuestionScreen());
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
