import 'package:flutter/material.dart';
import 'package:ecovote/my_map.dart';
import 'package:ecovote/my_map_state.dart';
import 'bottom_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'search_bar.dart'; // Import the SearchBar widget
import 'package:flutter/material.dart';
import 'package:ecovote/my_map.dart';
import 'package:ecovote/my_map_state.dart';
import 'bottom_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'search_bar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoVote',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<MyMapState> _mapKey = GlobalKey<MyMapState>();

  void _showBottomDrawer() {
    _scaffoldKey.currentState?.showBottomSheet((context) {
      return Container(
        height: 250,
        color: Colors.white,
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.language),
                  SizedBox(height: 10),
                  Text('Global'),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.local_offer),
                  SizedBox(height: 10),
                  Text('Local'),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.beach_access),
                  SizedBox(height: 10),
                  Text('Beach Cleaning'),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('EcoVote')),
      body: Stack(
        children: [
          MyMap(key: _mapKey),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white.withOpacity(0.9),
              child: SearchBar(),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _showBottomDrawer(),
            child: Icon(Icons.pending_actions),
            heroTag: "btn1", // Add unique heroTag to avoid conflicts
          ),
          SizedBox(height: 10), // Spacing between the buttons
          FloatingActionButton(
            onPressed: () {
              //_mapKey.currentState?.centerMapOnUserLocation();
            },
            child: Icon(Icons.my_location),
            heroTag: "btn2", // Add unique heroTag to avoid conflicts
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
