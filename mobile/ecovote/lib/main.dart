import 'package:ecovote/details.dart';
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
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => Login(),
        '/home': (context) => HomeScreen(),
        '/html': (context) => HtmlScreen(),
        // Add routes for your other screens
      },
    );
  }
}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key); // key is now nullable

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your login logic here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text('Login'),
          )
        ],
      ),
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(
              context, '/html'); // Navigate to the new HTML screen
          break;
        // Other cases...
      }
    });
  }

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

  //data
  List eventName = ["Event Name", "Event Name", "Event Name", "Event Name"];
  List description = [
    "Short Description",
    "Short Description",
    "Short Description",
    "Short Description"
  ];
  List image = [
    "https://sustainabletravel.org/wp-content/uploads/Blog-Image-Planting-Tree-Seedling.jpg",
    "https://previews.123rf.com/images/opolja/opolja1907/opolja190700427/127920348-group-of-young-people-playing-with-ball-at-the-beach-young-friends-enjoying-summer-holidays-on-a.jpg",
   "https://www.openaccessgovernment.org/wp-content/uploads/2018/11/dreamstime_s_74844293.jpg",
   "https://img.freepik.com/free-vector/protecting-environment-concept-illustration_114360-11985.jpg?w=2000"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(title: Text('EcoVote')),
      body: Stack(
        children: [
          MyMap(key: _mapKey),
          DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.2,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0, top: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Center(
                              child: Container(
                            width: 60,
                            height: 4,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30)),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "δημοφιλεις δρασεις",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                primary: false,
                                padding: const EdgeInsets.only(left: 3.0),
                                itemCount: eventName.length,
                                shrinkWrap: true,
                                itemBuilder: (ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Details(
                                                  eventName: eventName[index],
                                                  description:
                                                      description[index],
                                                  image: image[index])));
                                    },
                                    child: Container(
                                      height: 260,
                                      width: 140,
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 200,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                    image[index],
                                                  )),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .group_work_rounded,
                                                          color: Colors.green,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .person_2_rounded,
                                                          color: Colors.orange,
                                                        ),
                                                        Text("73"),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 2),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          eventName[index],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0, top: 2),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(description[
                                                            index])),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Random Heading",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                primary: false,
                                padding: const EdgeInsets.only(left: 3.0),
                                itemCount: eventName.length,
                                shrinkWrap: true,
                                itemBuilder: (ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Details(
                                                  eventName: eventName[index],
                                                  description:
                                                      description[index],
                                                  image: image[index])));
                                    },
                                    child: Container(
                                      height: 260,
                                      width: 140,
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 200,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                    image[index],
                                                  )),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .group_work_rounded,
                                                          color: Colors.green,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .person_2_rounded,
                                                          color: Colors.orange,
                                                        ),
                                                        Text("73"),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 2),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          eventName[index],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0, top: 2),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(description[
                                                            index])),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Random Heading",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                primary: false,
                                padding: const EdgeInsets.only(left: 3.0),
                                itemCount: eventName.length,
                                shrinkWrap: true,
                                itemBuilder: (ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Details(
                                                  eventName: eventName[index],
                                                  description:
                                                      description[index],
                                                  image: image[index])));
                                    },
                                    child: Container(
                                      height: 260,
                                      width: 140,
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 200,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                    image[index],
                                                  )),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .group_work_rounded,
                                                          color: Colors.green,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .person_2_rounded,
                                                          color: Colors.orange,
                                                        ),
                                                        Text("73"),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 2),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          eventName[index],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0, top: 2),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(description[
                                                            index])),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.transparent,
              child: SearchBar(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
