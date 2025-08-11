import 'package:get/get.dart';
import 'package:intricate1/feature/home/data/model/day_model.dart';

class DaySelectorController extends GetxController {
  var days = <DayModel>[].obs;
  var today = DateTime.now();
  var selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    generateDays();
  }

  void generateDays() {
    days.clear();
    DateTime start = DateTime.now();
    for (int i = -1; i < 30; i++) {
      DateTime date = start.add(Duration(days: i));
      bool isToday = _isSameDate(date, today);
      bool isYesterday = _isSameDate(date, today.subtract(Duration(days: 1)));
      bool isFuture = date.isAfter(today);
      bool isPast = date.isBefore(today) && !isToday && !isYesterday;

      days.add(
        DayModel(
          dayNumber: i + 2,
          date: date,
          isToday: isToday,
          isYesterday: isYesterday,
          isFuture: isFuture,
          isPast: isPast,
          isSelected: false,
        ),
      );
    }
  }

  void selectDay(int index) {
    for (var i = 0; i < days.length; i++) {
      days[i] = days[i].copyWith(isSelected: i == index);
    }
    selectedIndex.value = index;
    days.refresh();
  }

  bool _isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}