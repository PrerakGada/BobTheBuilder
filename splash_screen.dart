import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spike_codeshastra/Modules/details.dart';
import 'package:spike_codeshastra/Services/service.dart';
import 'dart:async';

// ignore: unused_import
import 'package:spike_codeshastra/screens/login_screen.dart';
//import 'package:spike_codeshastra/screens/map_screen.dart';
import 'package:spike_codeshastra/screens/p_dashboard.dart';
import 'package:spike_codeshastra/screens/project_login.dart';
//import 'package:spike_codeshastra/screens/map_screen.dart';

class Loading extends StatefulWidget {
  static const String id = 'splash_screen';

  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Extradetails e1 = Extradetails();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, ProjectLogin.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(height: 50),
              Image.asset('assets/images/logo2.jpg',width: 300,),
              Container(height: 35),
              SpinKitFadingCube(
                color: HexColor('#FFA451'),
              ),
              Container(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Build",
                      style: GoogleFonts.sigmarOne(
                          color: e1.secondarycolor(), fontSize: 60),
                    ),
                    Text(
                      "Constra",
                      style: GoogleFonts.sigmarOne(
                          color: e1.primarycolor(), fontSize: 40),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
