import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_color/domain/model/your_color.dart';

class CalendarYourColorNotifier extends StateNotifier<List<YourColor>> {
  CalendarYourColorNotifier() : super([]);

  void changeState(List<YourColor> yourColorList) => state = yourColorList;
}
