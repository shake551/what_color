import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/model/your_color.dart';
import 'package:what_color/domain/model/your_color_calendar.dart';

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<YourColorCalendar>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
      3,
      (index) => YourColorCalendar(
        DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
        YourColor(
          'WL9pxx5t7tEYAqrVS4qm',
          'dEVL82dqEGWSgoH1gb1pSHJ4U133',
          'weworkいける',
          34.62862257367425,
          135.5162821705957,
          const ColorBase(250, 132, 120),
          DateTime.parse('2023-04-06T09:34:37.320334'),
          DateTime.parse('2023-04-06T09:34:37.320362'),
        ),
      ),
    )
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 6, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month, kToday.day);
