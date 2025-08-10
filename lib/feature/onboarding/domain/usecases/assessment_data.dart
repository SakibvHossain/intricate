import 'package:intricate1/feature/onboarding/data/model/question_model.dart';
import 'package:intricate1/feature/onboarding/data/model/question_option_model.dart';

class AssessmentData {
  static List<QuestionModel> get questions => [
    QuestionModel(
      id: 'feeling',
      title: 'How are you feeling today?',
      subtitle: "Let's understand how you're feeling today.",
      options: [
        QuestionOption(
          id: 'good',
          title: "I'm feeling good!",
          subtitle: "I'm okay, not great, not bad.",
        ),
        QuestionOption(
          id: 'low',
          title: "I'm feeling a bit low.",
          subtitle: "I'm feeling really down today.",
        ),
        QuestionOption(
          id: 'neutral',
          title: "I'm feeling neutral.",
          subtitle: 'Neither good nor bad.',
        ),
        QuestionOption(
          id: 'excited',
          title: "I'm feeling excited!",
          subtitle: "I'm full of energy today!",
        ),
      ],
    ),
    QuestionModel(
      id: 'challenge',
      title: "What's been hardest for you lately?",
      subtitle: "Let's present what's been the most challenging for you.",
      options: [
        QuestionOption(
          id: 'rest',
          title: "Keep - I've been struggling to get enough rest.",
        ),
        QuestionOption(
          id: 'energy',
          title: "Design - I just don't see energized throughout the air.",
        ),
        QuestionOption(
          id: 'focus',
          title: "Momentum - It's hard to stay focused or get started.",
        ),
        QuestionOption(
          id: 'mood',
          title: "Mood - I'm feeling emotionally drained or overwhelmed.",
        ),
      ],
    ),
    QuestionModel(
      id: 'routine',
      title: "Do you prefer calm or energizing routines?",
      subtitle:
          "Do you need a calming routine or something more energizing today?",
      options: [
        QuestionOption(
          id: 'calm',
          title: "Calm - I need something peaceful and soothing today.",
        ),
        QuestionOption(
          id: 'energizing',
          title:
              "Energizing - I want something that will give me moving and motivated.",
        ),
        QuestionOption(
          id: 'not_sure',
          title: "I'm not sure - I could use other depending on the day.",
        ),
        QuestionOption(
          id: 'moderate',
          title: "I don't need anything too intense right now.",
        ),
      ],
    ),
    QuestionModel(
      id: 'wake_time',
      title: "What time do you usually wake up?",
      subtitle: "Your wake up time helps us create a balanced routine.",
      options: [
        QuestionOption(id: '6am', title: "6:00 AM - I start my day early."),
        QuestionOption(
          id: '7am',
          title: "7:00 AM - I wake up around this time.",
        ),
        QuestionOption(
          id: '8am',
          title: "8:00 AM - I usually get up a bit late.",
        ),
        QuestionOption(
          id: '9am_plus',
          title: "I'm a night owl - I need to wake up around 9:00 AM or later.",
        ),
      ],
    ),
    QuestionModel(
      id: 'goal',
      title: "What's your primary goal for using this app?",
      subtitle: "Let's focus on what you want to achieve.",
      options: [
        QuestionOption(
          id: 'calm',
          title: "Find Calm - I'm looking for ways to relax and manage breaks.",
        ),
        QuestionOption(
          id: 'energy',
          title:
              "Increase Energy - I need help boosting my motivation and energy levels.",
        ),
        QuestionOption(
          id: 'focus',
          title:
              "Improve Focus - I want to get back to a more focused, productive state.",
        ),
        QuestionOption(
          id: 'wellness',
          title:
              "Overall Wellness - I just want to feel better and take care of my mental health.",
        ),
      ],
    ),
  ];
}
