class DayModel {
  final int dayNumber;
  final DateTime date;
  final bool isToday;
  final bool isYesterday;
  final bool isFuture;
  final bool isPast;

  DayModel({
    required this.dayNumber,
    required this.date,
    required this.isToday,
    required this.isYesterday,
    required this.isFuture,
    required this.isPast,
  });
}
