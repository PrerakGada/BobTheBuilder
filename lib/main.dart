import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/login_screen.dart';
import 'package:spike_codeshastra/screens/register_screen.dart';
import 'package:spike_codeshastra/screens/splash_screen.dart';
import 'package:spike_codeshastra/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Spike());
}

class Spike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Loading.id,
      routes: {
        Loading.id: (context) => Loading(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}
