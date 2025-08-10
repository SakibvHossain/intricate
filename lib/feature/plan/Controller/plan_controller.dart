import 'package:get/get.dart';
import 'package:intricate1/feature/plan/Model/plan_model.dart';

class PlanController extends GetxController {
  final RxString userName = 'Saifur'.obs;

  final RxList<Plan> plans = <Plan>[
    Plan(
      name: 'Serenity Plan',
      status: 'In Progress',
      tasksCompleted: 18,
      totalTasks: 20,
      nextAction: 'Watch a calming video.',
    ),
    Plan(
      name: 'Momentum Plan',
      status: 'In Progress',
      tasksCompleted: 10,
      totalTasks: 20,
      nextAction: 'Watch a calming video.',
    ),
    Plan(
      name: 'Serenity Plan',
      status: 'In Progress',
      tasksCompleted: 18,
      totalTasks: 20,
      nextAction: 'Watch a calming video.',
    ),
    Plan(
      name: 'Momentum Plan',
      status: 'In Progress',
      tasksCompleted: 10,
      totalTasks: 20,
      nextAction: 'Watch a calming video.',
    ),
  ].obs;
}
