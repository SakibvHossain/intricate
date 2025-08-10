import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intricate1/feature/define_your_path/data/model/question_model.dart';

class QuestionController extends GetxController {
  final RxInt currentIndex = 0.obs;

  // One TextEditingController per field (even if only one field)
  RxList<TextEditingController> fieldControllers = <TextEditingController>[].obs;

  // Store all answers
  List<List<String>> answers = [];

  final List<TextQuestion> questions = [

    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'About You',
      fields: [
        'Full Name',
        'Location/Address',
        'What do you want to achieve?',
        'Why is this important to you?',
        'How will you achieve it?',
        'Target Timeline',
        'Robbins RPM Focus',
        'Lewis Value Proposition',
        'LinkedIn Profile',

      ],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'What transformation outcome do you desire most? ?',
      fields: [''],
    ),

    TextQuestion(
      subtitle: 'Please fill in your details',
      title: "What obstacle are you experiencing that's preventing your progress?",
      fields: [''],
    ),


    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'What inspired you to pursue this transformation at this moment?',
      fields: [''],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'On a scale of 1—10, how committed are you to achieving this outcome?',
      fields: [''],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'What strategies or solutions have you already tried?',
      fields: [''],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'Which personal strengths, skills, or resources can you leverage?',
      fields: [''],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: "How will you know when you've succeeded?",
      fields: [''],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: ' What timeframe are you hoping to achieve this transformation within?',
      fields: [''],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'Who in your life will support you through this journey, and how can they best assist?',
      fields: [''],
    ),
    TextQuestion(
      subtitle: 'Please fill in your details',
      title: 'What fears or concerns do you anticipate as you work toward your goal?',
      fields: [''],
    ),
    // Add more screens...
  ];

  @override
  void onInit() {
    super.onInit();
    _initControllers();
  }

  void _initControllers() {
    fieldControllers.clear();
    final fieldCount = questions[currentIndex.value].fields.length;
    fieldControllers.addAll(List.generate(fieldCount, (_) => TextEditingController()));
  }

  void nextQuestion() {
    // Save answers from controllers
    answers.add(fieldControllers.map((c) => c.text.trim()).toList());

    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      _initControllers();
    } else {
      Get.snackbar('Done', 'You’ve completed all questions!');
    }
  }
}
