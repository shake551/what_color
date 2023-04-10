import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_color/domain/model/your_color.dart';
import 'package:what_color/notifier/calendar_your_color.dart';
import 'package:what_color/widget/calendar/my_calendar_widget.dart';
import 'package:what_color/widget/your_color_list_widget.dart';

final calendarYourColorProvider =
    StateNotifierProvider<CalendarYourColorNotifier, List<YourColor>>(
  (ref) => CalendarYourColorNotifier(),
);

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Column(
        children: const <Widget>[
          MyCalendarWidgetConsumer(),
          Expanded(
            child: YourColorListWidgetConsumer(),
          ),
        ],
      ),
    );
  }
}

class MyCalendarWidgetConsumer extends ConsumerWidget {
  const MyCalendarWidgetConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyCalendarWidget(
      updateSelectedCalendarList: (List<YourColor> yourColorList) => {
        ref.read(calendarYourColorProvider.notifier).changeState(yourColorList),
      },
    );
  }
}

class YourColorListWidgetConsumer extends ConsumerWidget {
  const YourColorListWidgetConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return YourColorListWidget(
      feelList: ref.watch(calendarYourColorProvider),
    );
  }
}
