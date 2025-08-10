class SurveyResponse {
  final bool success;
  final String message;
  final SurveyData data;

  SurveyResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SurveyResponse.fromJson(Map<String, dynamic> json) {
    return SurveyResponse(
      success: json['success'],
      message: json['message'],
      data: SurveyData.fromJson(json['data']),
    );
  }
}

class SurveyData {
  final Persona primaryPersona;
  final Persona secondaryPersona;
  final List<CareerMatch> careerMatches;
  final String id;
  final String userId;
  final DateTime createdAt;

  SurveyData({
    required this.primaryPersona,
    required this.secondaryPersona,
    required this.careerMatches,
    required this.id,
    required this.userId,
    required this.createdAt,
  });

  factory SurveyData.fromJson(Map<String, dynamic> json) {
    return SurveyData(
      primaryPersona: Persona.fromJson(json['primaryPersona']),
      secondaryPersona: Persona.fromJson(json['secondaryPersona']),
      careerMatches: (json['careerMatches'] as List)
          .map((e) => CareerMatch.fromJson(e))
          .toList(),
      id: json['id'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Persona {
  final String type;
  final double confidence;
  final String description;

  Persona({
    required this.type,
    required this.confidence,
    required this.description,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      type: json['type'],
      confidence: (json['confidence'] as num).toDouble(),
      description: json['description'],
    );
  }
}

class CareerMatch {
  final String career;
  final double confidence;
  final String description;

  CareerMatch({
    required this.career,
    required this.confidence,
    required this.description,
  });

  factory CareerMatch.fromJson(Map<String, dynamic> json) {
    return CareerMatch(
      career: json['career'],
      confidence: (json['confidence'] as num).toDouble(),
      description: json['description'],
    );
  }
}
