import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'your_color.freezed.dart';

part 'your_color.g.dart';

@freezed
class YourColor with _$YourColor {
  const factory YourColor(String id,
      String comment,
      double latitude,
      double longitude,
      int r,
      int g,
      int b,) = _YourColor;

  factory YourColor.fromJson(Map<String, dynamic> json) =>
      _$YourColorFromJson(json);

  static List<YourColor> fromJsonList(List<dynamic> jsonList) {
    final yourColorList = <YourColor>[];
    for (final ele in jsonList) {
      yourColorList.add(YourColor.fromJson(ele as Map<String, dynamic>));
    }

    return yourColorList;
  }

  static YourColor fromFirestore(QueryDocumentSnapshot firestore) {
    final firestoreData = firestore.data()! as Map<String, dynamic>;
    firestoreData['id'] = firestore.id;
    return YourColor.fromJson(firestoreData);
  }

  static List<YourColor> fromFirestoreList(
      List<QueryDocumentSnapshot> jsonList,) {
    final yourColorList = <YourColor>[];
    for (final ele in jsonList) {
      yourColorList
          .add(YourColor.fromFirestore(ele));
    }

    return yourColorList;
  }
}
