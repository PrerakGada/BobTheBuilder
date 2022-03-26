// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/Services/service.dart';
import 'package:spike_codeshastra/screens/login_screen.dart';
import 'package:spike_codeshastra/screens/map_screen.dart';
import 'package:spike_codeshastra/screens/p_dashboard.dart';
import 'package:spike_codeshastra/screens/project_login.dart';
import 'package:spike_codeshastra/screens/projects.dart';
import 'package:spike_codeshastra/screens/register_screen.dart';
import 'package:spike_codeshastra/screens/splash_screen.dart';
import 'package:spike_codeshastra/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Spike());
}

// ignore: use_key_in_widget_constructors
class Spike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Loading.id,
      // ignore: duplicate_ignore
      routes: {
        Loading.id: (context) => const Loading(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        // ignore: equal_keys_in_map
         MapSample.id: (context)=> MapSample(),
         // ignore: prefer_const_constructors
         pDashboard.id:((context) => pDashboard()),
         // ignore: prefer_const_constructors
         Projects.id:((context) => Projects()),
         ProjectLogin.id:(context) => ProjectLogin()
         //MyApp.id:((context)=> MyApp())
      },
    );
  }
}
