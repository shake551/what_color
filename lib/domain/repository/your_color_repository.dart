import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/model/your_color.dart';

class YourColorRepository {
  static Future<List<YourColor>> getYourColor() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('your_color').get();

    return YourColor.fromFirestoreList(snapshot.docs);
  }

  static void create(
    String userId,
    String comment,
    double latitude,
    double longitude,
    ColorBase color,
  ) {
    final newYourColor = {
      'userId': userId,
      'comment': comment,
      'latitude': latitude,
      'longitude': longitude,
      'color': color.toJson(),
      'createdAt': DateTime.now().toString(),
      'updatedAt': DateTime.now().toString(),
    };

    FirebaseFirestore.instance.collection('your_color').add(newYourColor);
  }

  static Future<List<YourColor>> getYourColorByUserID(String userID) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('your_color')
        .where('userId', isEqualTo: userID)
        .orderBy('createdAt', descending: true)
        .get();

    return YourColor.fromFirestoreList(snapshot.docs);
  }

  static Future<Map<DateTime, List<YourColor>>> getYourColorForCalendar(
    String userID,
  ) async {
    final outputFormat = DateFormat('yyyy-MM-dd');
    final yourColorList = await getYourColorByUserID(userID);

    final groupedMap = <String, List<YourColor>>{};
    for (final element in yourColorList) {
      if (groupedMap.containsKey(outputFormat.format(element.createdAt))) {
        groupedMap[outputFormat.format(element.createdAt)]!.add(element);
      } else {
        groupedMap[outputFormat.format(element.createdAt)] = [element];
      }
    }

    final yourColorCalendarMap = <DateTime, List<YourColor>>{};
    for (final mapKey in groupedMap.keys) {
      yourColorCalendarMap[DateTime.parse(mapKey)] = groupedMap[mapKey]!;
    }

    return yourColorCalendarMap;
  }
}
