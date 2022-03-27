import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spike_codeshastra/Modules/details.dart';
import 'package:spike_codeshastra/screens/project_login.dart';
import 'dart:async';
import 'package:spike_codeshastra/screens/Project%20Owner/p_dashboard.dart';
import 'package:spike_codeshastra/screens/Contractor/c_dashboard.dart';
import 'package:spike_codeshastra/screens/Supervisor/s_dashboard.dart';


import 'package:spike_codeshastra/screens/select_login.dart';

class Loading extends StatefulWidget {
  static const String id = 'splash_screen';
  const Loading({Key? key}) : super(key: key);


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Extradetails e1=Extradetails();
  @override
  void initState()
  {
    super.initState();
    startTime();
  }

  startTime()
  {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    int? log = sharedPreferences.getInt('Login_status') ?? 0;
    log == 0 ?
    Navigator.pushReplacementNamed(context,ProjectLogin.id) :
        log == 1 ? Navigator.pushReplacementNamed(context,cDashboard.id) :
            log == 2 ?
        Navigator.pushReplacementNamed(context,pDashboard.id) :
            Navigator.pushReplacementNamed(context,sDashboard.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  'assets/images/Logo.jpeg',
                ),
                height: 80,
              ),
              Container(height:20),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Build",style: GoogleFonts.sigmarOne(color: e1.secondarycolor(),fontSize: 50), ),
                        Text("Constra",style: GoogleFonts.sigmarOne(color: e1.primarycolor(),fontSize:30), ),
                      ],
                    ),
                    Text("Build the bob"),
                  ],
                ),
              ),
              //Container(height: 05,),
              SizedBox(height: 150),
              SpinKitFadingCube(
                color: HexColor('#FFA451'),
              ),

            ],
          ),
        )

    );
  }
}