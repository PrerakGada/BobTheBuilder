// ignore_for_file: unnecessary_new, prefer_const_constructors, duplicate_ignore
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: use_key_in_widget_constructors
class MapSample extends StatefulWidget {
  static const String id = 'map_screen';
  @override
  State<MapSample> createState() => MapSampleState();
}

// ignore: duplicate_ignore
class MapSampleState extends State<MapSample> {
  GoogleMapController ?mapController;


  Set<Marker> markers={};
  
  BitmapDescriptor ?customIcon1;
  
  void initstate()
  {
    super.initState();

    // ignore: prefer_collection_literals
    markers = Set.from([]);
  
  }

  void _onmapcreated(GoogleMapController controller)
  {
    setState(() {
      markers.add(
        Marker(
        infoWindow: InfoWindow(
          title: 'Hello world',
          snippet: 'Basic',
        ),
        markerId: MarkerId('id-1'),
        position:LatLng(19.0760, 72.8777)),
      );
    });
  }
  /*createMarker(context) {

  if (customIcon1 == null) {

    ImageConfiguration configuration = createLocalImageConfiguration(context);

    BitmapDescriptor.fromAssetImage(configuration, 'assets/images/loc_mark.png')

        .then((icon) {

      setState(() {

        customIcon1 = icon;

      });

    });

  }
  }*/

  // ignore: prefer_final_fields
  Completer<GoogleMapController> _controller = Completer();
  
  // ignore: prefer_const_constructors
  static final CameraPosition _kGooglePlex = CameraPosition(
    // ignore: prefer_const_constructors
    target: LatLng(19.0760, 72.8777),
    zoom: 14.4746,
  );

  // ignore: prefer_const_constructors
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      // ignore: prefer_const_constructors
      target: LatLng(19.0760, 72.8777),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    //createMarker(context);
    return new Scaffold(
      body: GoogleMap(
        //mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: _onmapcreated,
        markers: markers,
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}