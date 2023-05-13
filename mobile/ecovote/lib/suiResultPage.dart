import 'package:flutter/material.dart';
import 'package:ecovote/my_map.dart';
import 'package:ecovote/my_map_state.dart';
import 'bottom_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'search_bar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'html.dart';
import 'QRScreen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatelessWidget {
  final String result;

  ResultPage({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Text(result),
      ),
    );
  }
}
