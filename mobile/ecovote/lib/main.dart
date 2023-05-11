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
