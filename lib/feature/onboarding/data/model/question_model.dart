import 'package:intricate1/feature/onboarding/data/model/question_option_model.dart';

class QuestionModel {
  final String id;
  final String title;
  final String subtitle;
  final List<QuestionOption> options;

  QuestionModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.options,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': title,
      'answer': subtitle,
    };
  }
}

