import 'package:event_management/screens/login_page.dart';
import 'package:event_management/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:event_management/widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/login', // Start at the Login Page
      routes: {
        '/login': (context) => LoginPage(), // Login Page Route
        '/signup': (context) => SignupPage(), // Signup Page Route
        '/home': (context) => BottomNavBar(), // Home Page Route
      },
    );
  }
}
