import 'package:ecovote/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Details extends StatefulWidget {
  String description="";
  String image="";
  String eventName="";
   Details({Key? key, required this.description, required this.eventName, required this.image}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.eventName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text("17/06- 12/06 | Lidl Hellas"),
                  Text("random"),
                ],
              ),
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Image(
                  image: NetworkImage(
                     widget.image)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SvgPicture.asset(
                      "assets/svg/1.svg",
                      // color: Theme.of(context).primaryColor,
                      height: 40,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/svg/2.svg",
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, left: 2),
                    child: Text("73"),
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.blue,
                    size: 40,
                  ),
                  Text("50"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Progress()));
                    },
                    child: Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Color.fromARGB(255, 164, 252, 132),
                          borderRadius: BorderRadius.circular(17)),
                      child: Center(
                        child: Text(
                          "next",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17)),
                    child: Center(
                      child: Text(
                        "text",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
