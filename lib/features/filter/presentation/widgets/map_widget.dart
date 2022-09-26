import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_booking_algoriza/config/location_services/location_services.dart';

class MapTest extends StatefulWidget {
  const MapTest({super.key});

  @override
  State<MapTest> createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  static Position? position;
  final Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentCameraPosition = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    bearing: 0.0,
    tilt: 0.0,
    zoom: 17,
  );
  Future<void> getCurrentLocation() async {
    await LocationServices.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: _myCurrentCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) => _mapController.complete(controller),
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : const Center(
                  child: CircularProgressIndicator(),
                )
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          child: const Icon(Icons.pin_drop_rounded),
          onPressed: _goToMyCurrentLocation,
        ),
      ),
    );
  }
}
