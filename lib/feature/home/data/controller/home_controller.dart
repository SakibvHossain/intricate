import 'package:get/get.dart';
import 'package:intricate1/feature/home/data/model/home_task_model.dart';

class HomeController extends GetxController {
  var tasks = <HomeTaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    tasks.assignAll([
      HomeTaskModel(
        time: '9:00 AM',
        type: 'Watch',
        title: 'How to Calm Your Morning',
        description: '',
        buttonText: 'Watch Now',
        isVideo: true,
      ),
      HomeTaskModel(
        time: '10:00 AM',
        type: 'Journal Prompt',
        title: 'List 3 things that made you smile this week.',
        description: 'Reflect on small moments of joy that brighten your week.',
        buttonText: 'Write your thing',
      ),
      HomeTaskModel(
        time: '11:30 AM',
        type: 'Breathe Deeply',
        title: '5-minute breathing exercise',
        description:
            'Focus on your breath to clear your mind. Let the tension melt away.',
        buttonText: 'Start Now',
      ),
      HomeTaskModel(
        time: '3:00 PM',
        type: 'Walk Time',
        title: 'Walk outside for 10 minutes',
        description:
            'A short walk can do wonders for your mood. Take a step outside, breathe fresh air, and stretch your legs.',
        buttonText: 'Start Now',
      ),
      HomeTaskModel(
        time: '10:00 AM',
        type: 'Hydrate',
        title: 'Drink Water & Hydrate',
        description: 'Reflect on small moments of joy that brighten your week.',
        buttonText: 'Write your thing',
      ),
      HomeTaskModel(
        time: '9:00 AM',
        type: 'Watch',
        title: 'How to Calm Your Morning',
        description: 'Video on calming techniques.',
        buttonText: 'Watch Now',
        isVideo: true,
      ),
    ]);
  }
}
