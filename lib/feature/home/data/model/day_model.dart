class DayModel {
  final int dayNumber;
  final DateTime date;
  final bool isToday;
  final bool isYesterday;
  final bool isFuture;
  final bool isPast;
  final bool isSelected;

  DayModel({
    required this.dayNumber,
    required this.date,
    required this.isToday,
    required this.isYesterday,
    required this.isFuture,
    required this.isPast,
    required this.isSelected,
  });

  DayModel copyWith({
    int? dayNumber,
    DateTime? date,
    bool? isToday,
    bool? isYesterday,
    bool? isFuture,
    bool? isPast,
    bool? isSelected,
  }) {
    return DayModel(
      dayNumber: dayNumber ?? this.dayNumber,
      date: date ?? this.date,
      isToday: isToday ?? this.isToday,
      isYesterday: isYesterday ?? this.isYesterday,
      isFuture: isFuture ?? this.isFuture,
      isPast: isPast ?? this.isPast,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}