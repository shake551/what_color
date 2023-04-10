import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:what_color/domain/model/your_color.dart';

part 'your_color_calendar.freezed.dart';

part 'your_color_calendar.g.dart';

@freezed
class YourColorCalendar with _$YourColorCalendar {
  const factory YourColorCalendar(
    DateTime createdAt,
    YourColor yourColor,
  ) = _YourColorCalendar;

  factory YourColorCalendar.fromJson(Map<String, dynamic> json) =>
      _$YourColorCalendarFromJson(json);

  static List<YourColorCalendar> fromJsonList(List<dynamic> jsonList) {
    final yourColorCalendarList = <YourColorCalendar>[];
    for (final ele in jsonList) {
      yourColorCalendarList
          .add(YourColorCalendar.fromJson(ele as Map<String, dynamic>));
    }

    return yourColorCalendarList;
  }

  static YourColorCalendar fromFirestore(QueryDocumentSnapshot firestore) {
    final firestoreData = firestore.data()! as Map<String, dynamic>;
    firestoreData['id'] = firestore.id;
    return YourColorCalendar.fromJson(firestoreData);
  }

  static List<YourColorCalendar> fromFirestoreList(
    List<QueryDocumentSnapshot> jsonList,
  ) {
    final yourColorCalendarList = <YourColorCalendar>[];
    for (final ele in jsonList) {
      yourColorCalendarList.add(YourColorCalendar.fromFirestore(ele));
    }

    return yourColorCalendarList;
  }

  static List<YourColor> toYourColorList(
    List<YourColorCalendar> yourColorCalendarList,
  ) {
    final yourColorList = <YourColor>[];
    for (final ele in yourColorCalendarList) {
      yourColorList.add(ele.yourColor);
    }

    return yourColorList;
  }
}
