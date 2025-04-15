import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fooddelivery_app/Add%20to%20cart.dart';
import 'package:fooddelivery_app/intropage.dart';
import 'package:fooddelivery_app/loginpage.dart';
import 'package:fooddelivery_app/mainscreen.dart';
import 'package:fooddelivery_app/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home:page4(), // Ensure IntroPage() exists in intropage.dart
    );
  }
}
