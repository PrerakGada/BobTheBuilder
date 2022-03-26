import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/select_login.dart';
import 'package:spike_codeshastra/screens/splash_screen.dart';
import 'package:spike_codeshastra/screens/worker_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Spike());
}

class Spike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Loading.id,
      routes: {
        Loading.id: (context) => Loading(),
        SelectLogin.id: (context) => SelectLogin(),
        WorkerLogin.id: (context) => WorkerLogin(),
        //RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}
