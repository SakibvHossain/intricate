import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/core/components/custom_button.dart';
import 'package:intricate1/feature/define_your_path/controller/question_controller.dart';

class TextQuestionScreen extends StatelessWidget {
  TextQuestionScreen({super.key});

  final QuestionController controller = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            final question = controller.questions[controller.currentIndex.value];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Static Header (from design)
                  const Text(
                    'Define Your Path',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Create your personalized roadmap using our AI-powered goal mapping system',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Question Label
                  Text(
                    '${controller.currentIndex.value + 1}. ${question.title}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Input Fields (1 or many)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(question.fields.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  question.fields[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                TextField(
                                  controller: controller.fieldControllers[index],
                                  maxLines: 5,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: question.fields[index],
                                    hintStyle:
                                        const TextStyle(color: Colors.white54),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    contentPadding: const EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.white38),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.white38),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.greenAccent),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  // Next Button
                  ComponentCustomButton(
                      text: 'Next',
                      gradientColors: const [
                        Color(0xFF7eb243),
                        Color(0xFF024015),
                      ],
                      borderRadius: 8,
                      height: 50,
                      onTap: () async {
                        controller.nextQuestion();
                      })
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
