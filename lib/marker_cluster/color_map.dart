import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what_color/domain/model/cluster_place.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/repository/your_color_repository.dart';

class ColorMap extends StatefulWidget {
  const ColorMap({super.key});

  @override
  State<ColorMap> createState() => ColorMapState();
}

class ColorMapState extends State<ColorMap> {
  late ClusterManager _manager;

  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};
  List<ClusterPlace> items = [];

  Position? currentPosition;
  late StreamSubscription<Position> positionStream;

  //初期位置
  late CameraPosition _kGooglePlex;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  bool isLoading = true;

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

      setState(() {
        _kGooglePlex = CameraPosition(
          target: LatLng(position!.latitude, position.longitude),
          zoom: 14,
        );
      });
    });

    super.initState();
  }

  Future<void> _setClusterItem() async {
    final yourColorList = await YourColorRepository.getYourColor();
    setState(() {
      items = ClusterPlace.fromYourColorList(yourColorList);
      isLoading = false;
    });
  }

  ClusterManager<ClusterItem> _initClusterManager() {
    return ClusterManager<ClusterPlace>(
      items,
      _updateMarkers,
      markerBuilder: _markerBuilder,
      // levels: const [1, 3, 6, 9, 12, 15],
      levels: const [1, 3, 5, 7, 9, 11, 13, 15],
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
    if (isLoading) {
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

  Future<Marker> Function(Cluster<ClusterPlace>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: await _getMarkerBitmap(
            cluster,
            cluster.items.length,
          ),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(
    Cluster<ClusterPlace> placeCluster,
    int count,
  ) async {
    final pictureRecorder = PictureRecorder();
    final canvas = Canvas(pictureRecorder);

    final paint = Paint();

    final size = 50 * count.toDouble();

    paint.color = Colors.transparent;
    final rect = Rect.fromLTWH(0, 0, size, size);
    canvas.drawRect(rect, paint);

    // 円（塗りつぶし）
    final baseColorList = <ColorBase>[];

    for (final element in placeCluster.items) {
      baseColorList.add(element.color);
    }

    final averageColor = ColorBase.averageColor(baseColorList);
    paint.color =
        Color.fromRGBO(averageColor.r, averageColor.g, averageColor.b, 1)
            .withOpacity(0.8);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2, paint);

    final img = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
