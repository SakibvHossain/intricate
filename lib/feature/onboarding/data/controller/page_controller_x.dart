import 'package:get/get.dart';

class PageControllerX extends GetxController {
  // Use RxInt for reactive state management
  RxInt currentPage = 0.obs;  // Use RxInt to make it reactive
  final RxInt totalPages = 5.obs;  // Use RxInt in case totalPages changes dynamically

  // Method to set page index
  void setPage(int page) {
    currentPage.value = page;  // Update using .value
    update();  // Notify listeners about the change
  }

  double get progress => (currentPage.value + 1) / totalPages.value;

  final List<Map<String, dynamic>> pagesData = [
    {
      'question': 'How are you feeling today?',
      'options': [
        'Motivation – It’s hard to stay focused or get started.',
        'Energy – I feel drained or tired most of the day.',
        'Mood – I’m feeling low or irritable.'
      ]
    },
    {
      'question': 'How’s your sleep been?',
      'options': [
        'I’m not sleeping well at all.',
        'I wake up tired.',
        'Sleep has been okay.'
      ]
    },
    {
      'question': 'How’s your focus?',
      'options': [
        'I can’t focus on tasks.',
        'My attention keeps drifting.',
        'I’m staying mostly focused.'
      ]
    },
    {
      'question': 'How’s your sleep been?',
      'options': [
        'I’m not sleeping well at all.',
        'I wake up tired.',
        'Sleep has been okay.'
      ]
    },
    {
      'question': 'How’s your focus?',
      'options': [
        'I can’t focus on tasks.',
        'My attention keeps drifting.',
        'I’m staying mostly focused.'
      ]
    }
  ];

  int get totalPagesCount => pagesData.length;
}
