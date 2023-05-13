import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: QrImage(
          data: "This is a string of text encoded in a QR code",
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
