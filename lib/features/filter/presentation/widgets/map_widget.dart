import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_booking_algoriza/config/location_services/location_services.dart';
import 'package:hotel_booking_algoriza/core/widgets/progrees_indicator.dart';

class MapTest extends StatefulWidget {
  const MapTest({super.key, required this.markers});
  final Set<Marker> markers;
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
    zoom: 5,
  );
  Future<void> getCurrentLocation() async {
    await LocationServices.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  // Set<Marker> markers = {
  //   const Marker(
  //     markerId: MarkerId('value'),
  //     position: LatLng(9.669111, 80.014007),
  //   )
  // };

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Widget buildMap() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GoogleMap(
          markers: widget.markers,
          initialCameraPosition: _myCurrentCameraPosition,
          mapType: MapType.normal,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) => _mapController.complete(controller),
        ),
      ),
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return position != null ? buildMap() : const CustmProgreesIndicator();
  }
}
// floatingActionButton: Container(
//         margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
//         child: FloatingActionButton(
//           child: const Icon(Icons.pin_drop_rounded),
//           onPressed: _goToMyCurrentLocation,
//         ),
//       ),