import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what_color/domain/repository/your_color_repository.dart';
import 'package:what_color/marker_cluster/place.dart';

class ColorMap extends StatefulWidget {
  const ColorMap({super.key});

  @override
  State<ColorMap> createState() => ColorMapState();
}

class ColorMapState extends State<ColorMap> {
  late ClusterManager _manager;

  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};
  List<Place> items = [];

  Position? currentPosition;
  late StreamSubscription<Position> positionStream;

  //初期位置
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(43.0686606, 141.3485613),
    zoom: 14,
  );

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  @override
  void initState() {
    //位置情報が許可されていない時に許可をリクエストする
    Future(() async {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
    });

    Future(() async {
      await _setClusterItem();
      _manager = _initClusterManager();
    });

    //現在位置を更新し続ける
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      currentPosition = position;
      if (kDebugMode) {
        print(
          position == null
              ? 'Unknown'
              : '${position.latitude}, '
                  '${position.longitude}',
        );
      }
    });

    super.initState();
  }

  Future<void> _setClusterItem() async {
    final yourColorList = await YourColorRepository.getYourColor();
    setState(() {
      items = Place.fromYourColorList(yourColorList);
    });
  }

  ClusterManager<ClusterItem> _initClusterManager() {
    return ClusterManager<Place>(
      items,
      _updateMarkers,
      markerBuilder: _markerBuilder,
      levels: const [1, 3, 6, 9, 12, 15],
    );
  }

  void _updateMarkers(Set<Marker> markers) {
    if (kDebugMode) {
      print('Updated ${markers.length} markers');
    }
    setState(() {
      this.markers = markers;
    });
  }

  @override
  void dispose() {
    super.dispose();
    positionStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _manager.setMapId(controller.mapId);
        },
        onCameraMove: _manager.onCameraMove,
        onCameraIdle: _manager.updateMap,
      ),
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: await _getMarkerBitmap(
            cluster.items.length,
            text: cluster.isMultiple ? cluster.count.toString() : null,
          ),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int count, {String? text}) async {
    final pictureRecorder = PictureRecorder();
    final canvas = Canvas(pictureRecorder);

    final paint = Paint();

    final size = 20 * count.toDouble();

    paint.color = Colors.transparent;
    final rect = Rect.fromLTWH(0, 0, size, size);
    canvas.drawRect(rect, paint);

    // 円（塗りつぶし）
    paint.color = Colors.pink.withOpacity(0.5);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2, paint);

    final img = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
