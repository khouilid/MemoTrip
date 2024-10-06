import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template/Features/Home/presentation/widgets/custom_marker.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapViewState();
}

class _MapViewState extends State<MapPage> {
  /// the controller of the map
  final Completer<GoogleMapController> _mapController = Completer();

  bool _isLoaded = false;

  /// markers List
  final Map<String, Marker> _markers = {};

  /// the style of the map
  late String _mapStyleString;

  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    parseData();
    rootBundle.loadString('assets/data/map_styles.json').then((string) {
      _mapStyleString = string;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _onBuildCompleted();
    });

    super.initState();
  }

  @override
  void dispose() {
    _mapController.future.then((value) {
      value.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: EdgeInsets.only(
        bottom: 30,
      ),
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      initialCameraPosition: const CameraPosition(
        target: LatLng(48.864716, 2.349014), // France
        zoom: 13.0,
      ),
      compassEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
        _mapController.future.then((value) {
          value.setMapStyle(_mapStyleString);
        });
      },
      onCameraMoveStarted: () {},
      onCameraIdle: () {},
      onCameraMove: (CameraPosition position) {},
      markers: _markers.values.toSet(),
    );
  }

  Future<void> _onBuildCompleted() async {
    await Future.wait(data.map((value) async {
      Marker marker = await _generateMarkersFromWidgets(value);
      setState(() {
        _markers[marker.markerId.value] = marker;
      });
    }));
    setState(() {
      _isLoaded = true;
    });
  }

  Future<Marker> _generateMarkersFromWidgets(Map<String, dynamic> datas) async {
    RenderRepaintBoundary boundary = datas['globalKey']
        .currentContext
        ?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 2);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return Marker(
      markerId: MarkerId(datas['id']),
      position: datas['position'],
      icon: BitmapDescriptor.bytes(byteData!.buffer.asUint8List()),
      onTap: () {
        // context.pushNamed('offre_remp_detail', pathParameters: {
        //   'id': datas['id'],
        //   'isGuest': 'false',
        // });
      },
    );
  }

  void parseData() {
    [
      1,
    ].map((e) {
      Map<String, dynamic> res = {
        'id': e..toString(),
        'globalKey': GlobalKey(),
        'position': LatLng(48.864716, 2.349014),
        'widget': CustomMarker(),
      };

      data.add(res);
    }).toList();
  }
}
