import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/model/your_color.dart';

class ClusterPlace with ClusterItem {
  ClusterPlace({
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

  static ClusterPlace fromYourColor(YourColor yourColor) {
    return ClusterPlace(
      name: yourColor.id,
      latLng: LatLng(
        yourColor.latitude,
        yourColor.longitude,
      ),
      color: yourColor.color,
    );
  }

  static List<ClusterPlace> fromYourColorList(List<YourColor> yourColorList) {
    final placeList = <ClusterPlace>[];
    for (final ele in yourColorList) {
      placeList.add(ClusterPlace.fromYourColor(ele));
    }

    return placeList;
  }
}
