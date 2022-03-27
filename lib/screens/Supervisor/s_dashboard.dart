import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spike_codeshastra/screens/project_login.dart';


class sDashboard extends StatefulWidget {
  static const String id = 'safety_login';
  const sDashboard({Key? key}) : super(key: key);

  @override
  State<sDashboard> createState() => _sDashboardState();
}

class _sDashboardState extends State<sDashboard> {
  File? _image;
  Uint8List? decode;
  String? uploadDoc;

  Future pickImage(ImageSource source1) async {
    try {
      final image =
      await ImagePicker().pickImage(source: source1, imageQuality: 50);

      if (image != null) {
        setState(() {
          _image = File(image.path);
          print(image.path);
        });

        final bytes = File(image.path).readAsBytesSync();
        uploadDoc = base64UrlEncode(bytes);
        print(uploadDoc);

        final decodedBytes = base64Decode(uploadDoc!);
        setState(() {
          //this.uploadDoc = uploadDoc;

          decode = decodedBytes;
        });



        //print("Shubh 6444444 " + img64);
      }
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Supervisor"),
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
                sharedPreferences.setInt('Login_status', 0);
                Fluttertoast.showToast(
                  msg: "Logged Out Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                );
                Navigator.pushNamed(context, ProjectLogin.id);
              },
              label: Text("Logout"),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Worker Protection System",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _image == null
                      ? Text(
                    "Edit Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      : Image.file(_image!)),
              Center(
                child: Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () => pickImage(ImageSource.camera),
                      child: Text('CAMERA',
                          style:
                          TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () => pickImage(ImageSource.gallery),
                      child: Text('GALLERY',
                          style:
                          TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


