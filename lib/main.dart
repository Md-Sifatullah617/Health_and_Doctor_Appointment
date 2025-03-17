import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_and_doctor_appointment/mainPage.dart';
import 'package:health_and_doctor_appointment/screens/doctorProfile.dart';
import 'package:health_and_doctor_appointment/screens/firebaseAuth.dart';
import 'package:health_and_doctor_appointment/screens/myAppointments.dart';
import 'package:health_and_doctor_appointment/screens/skip.dart';
import 'package:health_and_doctor_appointment/screens/userProfile.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // Removed FirebaseAuth instance
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // User? user;

  // Static user data
  final bool isUserLoggedIn = true;

  // Removed _getUser method
  // Future<void> _getUser() async {
  //   user = _auth.currentUser;
  // }

  @override
  Widget build(BuildContext context) {
    // Removed _getUser call
    // _getUser();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => isUserLoggedIn ? MainPage() : Skip(),
        '/login': (context) => AuthScreen(),
        '/home': (context) => MainPage(),
        '/profile': (context) => UserProfile(),
        '/MyAppointments': (context) => MyAppointments(),
        '/DoctorProfile': (context) => DoctorProfile(doctor: 'Doctor Name'),
      },
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
    );
  }
}
