class Plan {
  final String name;
  final String status;
  final int tasksCompleted;
  final int totalTasks;
  final String nextAction;

  Plan({
    required this.name,
    required this.status,
    required this.tasksCompleted,
    required this.totalTasks,
    required this.nextAction,
  });

  double get progress => tasksCompleted / totalTasks;
}
