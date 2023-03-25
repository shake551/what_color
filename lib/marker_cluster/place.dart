import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/model/your_color.dart';

class Place with ClusterItem {
  Place({
    required this.name,
    required this.latLng,
    required this.color,
    this.isClosed = false,
  });

  final String name;
  final bool isClosed;
  final LatLng latLng;
  final ColorBase color;

  @override
  String toString() {
    return 'Place $name (closed : $isClosed)';
  }

  @override
  LatLng get location => latLng;

  static Place fromYourColor(YourColor yourColor) {
    return Place(
      name: yourColor.id,
      latLng: LatLng(
        yourColor.latitude,
        yourColor.longitude,
      ),
      color: yourColor.color,
    );
  }

  static List<Place> fromYourColorList(List<YourColor> yourColorList) {
    final placeList = <Place>[];
    for (final ele in yourColorList) {
      placeList.add(Place.fromYourColor(ele));
    }

    return placeList;
  }
}
