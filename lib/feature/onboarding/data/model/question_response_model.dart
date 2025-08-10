class QuestionResponseModel {
  final String question;
  final String answer;

  QuestionResponseModel({
    required this.question,
    required this.answer,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}
