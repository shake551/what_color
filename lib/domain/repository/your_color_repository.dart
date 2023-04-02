import 'package:cloud_firestore/cloud_firestore.dart';
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
        .get();

    return YourColor.fromFirestoreList(snapshot.docs);
  }
}
