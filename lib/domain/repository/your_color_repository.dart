import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:what_color/domain/model/your_color.dart';

class YourColorRepository {
  static Future<List<YourColor>> getYourColor() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('your_color').get();

    return YourColor.fromFirestoreList(snapshot.docs);
  }
}
