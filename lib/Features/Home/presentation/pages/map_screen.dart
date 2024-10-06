import 'dart:async';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/Home/presentation/widgets/custom_marker.dart';
import 'package:template/Features/Home/shared/home_providers.dart';
import 'package:template/core/presentation/routes/app_router.gr.dart';

class MapPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<MapPage> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapPage> {
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
      _onBuildCompleted().listen((marker) {
        setState(() {
          _markers[marker.markerId.value] = marker;
        });
      }, onError: (error) {
        print('Error while building map: $error');
        throw Exception('Error while building map');
      });
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
    return _isLoaded
        ? GoogleMap(
            padding: EdgeInsets.only(
              bottom: 30,
            ),
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(48.864716, 2.349014), // France
              zoom: 8.0,
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
          )
        : ListView(
            children: [
              for (int i = 0; i < data.length; i++)
                Transform.translate(
                  offset: Offset(
                    -MediaQuery.of(context).size.width * 2,
                    -MediaQuery.of(context).size.height * 2,
                  ),
                  child: RepaintBoundary(
                    key: data[i]['globalKey'],
                    child: data[i]['widget'],
                  ),
                )
            ],
          );
  }

  Stream<Marker> _onBuildCompleted() async* {
    for (var value in data) {
      try {
        Marker marker = await _generateMarkersFromWidgets(value);
        yield marker;
        setState(() {});
      } catch (error, stackTrace) {
        throw Exception('$error $stackTrace');
      }
    }
    setState(() {
      _isLoaded = true;
    });
  }

  Future<Marker> _generateMarkersFromWidgets(Map<String, dynamic> datas) async {
    RenderRepaintBoundary boundary = datas['globalKey']
        .currentContext
        ?.findRenderObject() as RenderRepaintBoundary;

    // Ensure the widget is painted
    await Future.delayed(const Duration(milliseconds: 100));

    ui.Image image = await boundary.toImage(pixelRatio: .85);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return Marker(
      markerId: MarkerId(datas['id']),
      position: datas['position'],
      icon: BitmapDescriptor.bytes(byteData!.buffer.asUint8List()),
      onTap: () {
        context.router.push(
          ImageViewerRoute(memoryModel: datas['model']),
        );
      },
    );
  }

  void parseData() {
    ref.read(memoryModelProvider).map((e) {
      Map<String, dynamic> res = {
        'id': e.id.toString(),
        'globalKey': GlobalKey(),
        'position': LatLng(e.latitude, e.longitude),
        "model": e,
        'widget': CustomMarker(
          memoryModel: e,
        ),
      };

      data.add(res);
    }).toList();
    print(data.length);
  }
}
