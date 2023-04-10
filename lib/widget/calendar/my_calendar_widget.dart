import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:what_color/domain/model/your_color_calendar.dart';
import 'package:what_color/widget/calendar/util.dart';

class MyCalendarWidget extends StatefulWidget {
  const MyCalendarWidget({required this.updateSelectedCalendarList, super.key});

  final Function(List<YourColorCalendar>) updateSelectedCalendarList;

  @override
  MyCalendarWidgetState createState() => MyCalendarWidgetState();
}

class MyCalendarWidgetState extends State<MyCalendarWidget> {
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<YourColorCalendar> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      widget.updateSelectedCalendarList(_getEventsForDay(selectedDay));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<YourColorCalendar>(
      locale: 'ja_JP',
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      rangeStartDay: _rangeStart,
      rangeEndDay: _rangeEnd,
      rangeSelectionMode: _rangeSelectionMode,
      eventLoader: _getEventsForDay,
      calendarStyle: const CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.black),
        todayDecoration: BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        markerDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
      onDaySelected: _onDaySelected,
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      calendarBuilders: CalendarBuilders(
        //日=>赤、土=>青で表示
        dowBuilder: (_, day) {
          if (day.weekday == DateTime.sunday) {
            final text = DateFormat.E('ja').format(day);
            return Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (day.weekday == DateTime.saturday) {
            final text = DateFormat.E('ja').format(day);
            return Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.blue),
              ),
            );
          }
          if (day.weekday != DateTime.saturday ||
              day.weekday != DateTime.sunday) {
            final text = DateFormat.E('ja').format(day);
            return Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
