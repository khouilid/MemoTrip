import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template/core/presentation/managers/color_manager.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MapViewState();
}

class _MapViewState extends State<HomePage> {
  /// the controller of the map
  final Completer<GoogleMapController> _mapController = Completer();

  /// markers List
  final Map<String, Marker> _markers = {};

  /// isLoaded
  bool _isLoaded = false;

  /// the style of the map
  late String _mapStyleString;

  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    // parseData();
    rootBundle.loadString('assets/data/map_styles.json').then((string) {
      _mapStyleString = string;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(
          const Duration(milliseconds: 100), () => {_onBuildCompleted()});
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
              bottom: MediaQuery.of(context).size.height * 0.3,
            ),
            myLocationEnabled: true,
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
            // get map center
            onCameraMove: (CameraPosition position) {},

            /// markers
            markers: {
              ..._markers.values.toSet(),
            },
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

  Future<void> _onBuildCompleted() async {
    int max = data.length > 10 ? 9 : data.length;
    await Future.wait(data.getRange(0, max).map((value) async {
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
    ui.Image image = await boundary.toImage(pixelRatio: 1);
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
}

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(999),
                ),
                width: 70,
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '$price €',
                      style: const TextStyle(
                        color: AppColors.black,
                        // fontSize: FontSizes.sm,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    // par jour
                    const Text(
                      'Par jour',
                      style: TextStyle(
                        color: AppColors.black,
                        // fontSize: FontSizes.xxs,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -1),
            child: Transform.scale(
              scale: 6,
              child: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.white,
                size: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
