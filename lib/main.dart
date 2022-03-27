import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/p_dashboard.dart';
import 'package:spike_codeshastra/screens/Project%20Owner/projects.dart';
import 'package:spike_codeshastra/screens/Contractor/c_dashboard.dart';
import 'package:spike_codeshastra/screens/contractor_login.dart';
import 'package:spike_codeshastra/screens/project_login.dart';
import 'package:spike_codeshastra/screens/select_login.dart';
import 'package:spike_codeshastra/screens/signup.dart';
import 'package:spike_codeshastra/screens/splash_screen.dart';
import 'package:spike_codeshastra/screens/Supervisor/s_dashboard.dart';

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
        SignUp.id: (context) => SignUp(),
        ProjectLogin.id: (context) => ProjectLogin(),
        pDashboard.id: (context) => pDashboard(),
        Projects.id: (context) => Projects(),
        cDashboard.id: (context) => cDashboard(),
        sDashboard.id: (context) => sDashboard(),
      },
    );
  }
}
