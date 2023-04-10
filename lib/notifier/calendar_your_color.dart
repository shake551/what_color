import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_color/domain/model/your_color_calendar.dart';

class CalendarYourColorNotifier extends StateNotifier<List<YourColorCalendar>> {
  CalendarYourColorNotifier() : super([]);

  void changeState(List<YourColorCalendar> yourColorList) =>
      state = yourColorList;
}
