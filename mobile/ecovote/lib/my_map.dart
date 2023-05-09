import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MyMap extends StatefulWidget {
  MyMap({Key? key}) : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(37.9838, 23.7275), // Coordinates for Athens, Greece
        zoom: 9.2,
      ),
      mapController: mapController,
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 50.0,
              height: 50.0,
              point: LatLng(
                  37.9795, 23.7162), // Coordinates for the Acropolis of Athens
              builder: (context) => Icon(
                Icons.location_on,
                color: Colors.red,
              ),
            ),
            Marker(
              width: 50.0,
              height: 50.0,
              point: LatLng(37.9364,
                  23.9475), // Coordinates for the Athens International Airport
              builder: (context) => Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _centerMapOnUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      mapController.move(LatLng(position.latitude, position.longitude), 15.0);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to find your location.')),
      );
    }
  }
}
