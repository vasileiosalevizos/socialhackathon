import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      child: TextField(
          enabled: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 153, 252, 120),
            labelText: "    Search",
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.mic),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          )),
    );
  }
}
