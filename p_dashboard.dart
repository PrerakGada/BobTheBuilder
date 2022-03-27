// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/projects.dart';
//import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spike_codeshastra/Services/service.dart';

class pDashboard extends StatefulWidget {
  static const String id = 'Dashboard';

  const pDashboard({Key? key}) : super(key: key);

  @override
  State<pDashboard> createState() => _pDashboardState();
}

class _pDashboardState extends State<pDashboard> {
  DataService? d1;
  GoogleMapController? mapController;
 // int count = 0;
  void initstate() {
    super.initState();

    // ignore: prefer_collection_literals
    markers = Set.from([]);
  }

  void _onmapcreated(GoogleMapController controller) {
    setState(() {
      markers.add(
        Marker(
            infoWindow: InfoWindow(
              title: 'Hello world',
              snippet: 'Basic',
            ),
            markerId: MarkerId('id-1'),
            position: LatLng(19.0760, 72.8777)),
      );
    });
  }

  //final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  BitmapDescriptor? customIcon1;

  static final CameraPosition _kGooglePlex = CameraPosition(
    // ignore: prefer_const_constructors
    target: LatLng(19.0760, 72.8777),
    zoom: 14.4746,
  );

  /*static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      // ignore: prefer_const_constructors
      target: LatLng(19.0760, 72.8777),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/

  /*Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Project Owner',
        home: Scaffold(
          // ignore: prefer_const_constructors
          appBar: AppBar(title: Text("Project Owner")),
          body: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                height: 50,
              ),
              Center(
                  child: Text(
                'A drawer is an invisible side screen.',
                style: TextStyle(fontSize: 20.0),
              )),
              Container(
                height: 70,
              ),

              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('projects')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(), 
                      );
                    } else {
                      return SizedBox(
                        height: 30,
                        child: ListView.builder(
                        
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            markers.add(
                              Marker(
                                  infoWindow: InfoWindow(
                                    title: snapshot.data?.docs[index]['contractor'],
                                    snippet: snapshot.data?.docs[index]['name'],
                                  ),
                                  markerId: MarkerId('$index'),
                                  position: LatLng(double.parse(snapshot.data?.docs[index]['lat']),double.parse(snapshot.data?.docs[index]['long']))),
                            );
                            return Container();
                          },
                        ),
                      );
                    }
                  }),

              // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
              Container(
                child: GoogleMap(
                  onMapCreated:_onmapcreated,
                  initialCameraPosition: _kGooglePlex,
                  markers: markers,
                ),
                height: 600,
                width: 400,
              ),
            ],
          ),
          /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Shubh Zatakia"),
                  accountEmail: Text("shubhzatakia111@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      "S",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage(
                      'assets/images/logo2.jpg',
                    ),
                  ),
                  title: Text("Projects"),
                  onTap: () {
                    // print("shubh");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Projects()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Contractor"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text("Supervisor"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text("Task"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

// ignore: use_key_in_widget_constructor