import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what_color/marker_cluster/place.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cluster Manager Demo',
      home: MapSample(),
    );
  }
}

// Clustering maps

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late ClusterManager _manager;

  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  final CameraPosition _parisCameraPosition =
      const CameraPosition(target: LatLng(48.856613, 2.352222), zoom: 12.0);

  List<Place> items = [
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Place $i',
          latLng: LatLng(48.848200 + i * 0.001, 2.319124 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Restaurant $i',
          isClosed: i % 2 == 0,
          latLng: LatLng(48.858265 - i * 0.001, 2.350107 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Bar $i',
          latLng: LatLng(48.858265 + i * 0.01, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Hotel $i',
          latLng: LatLng(48.858265 - i * 0.1, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test $i',
          latLng: LatLng(66.160507 + i * 0.1, -153.369141 + i * 0.1)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test2 $i',
          latLng: LatLng(-36.848461 + i * 1, 169.763336 + i * 1)),
  ];

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(
      items,
      _updateMarkers,
      markerBuilder: _markerBuilder,
      levels: const [1, 3, 6, 9, 12, 15],
    );
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _parisCameraPosition,
          markers: markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            _manager.setMapId(controller.mapId);
          },
          onCameraMove: _manager.onCameraMove,
          onCameraIdle: _manager.updateMap),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _manager.setItems(<Place>[
            for (int i = 0; i < 30; i++)
              Place(
                  name: 'New Place ${DateTime.now()} $i',
                  latLng: LatLng(48.858265 + i * 0.01, 2.350107))
          ]);
        },
        child: const Icon(Icons.update),
      ),
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            cluster.items.forEach((p) => print(p));
          },
          icon: await _getMarkerBitmap(cluster.items.length,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int count, {String? text}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final paint = Paint();

    double size = 20 * count.toDouble();

    paint.color = Colors.transparent;
    var rect = Rect.fromLTWH(0, 0, size, size);
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
