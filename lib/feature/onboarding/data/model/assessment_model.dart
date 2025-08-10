class AssessmentModel {
  int currentStep;
  final int totalSteps;
  Map<String, String?> selectedAnswers;

  AssessmentModel({
    required this.currentStep,
    required this.totalSteps,
    required this.selectedAnswers,
  });

  AssessmentModel copyWith({
    int? currentStep,
    int? totalSteps,
    Map<String, String?>? selectedAnswers,
  }) {
    return AssessmentModel(
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}
