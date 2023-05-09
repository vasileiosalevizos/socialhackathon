// bottom_drawer.dart
import 'package:flutter/material.dart';

class BottomDrawer extends StatefulWidget {
  @override
  _BottomDrawerState createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(3, (index) {
          return Card(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
