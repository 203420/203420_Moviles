import 'package:flutter/material.dart';
import 'package:new_app/pages/login.dart';
import 'package:new_app/pages/register.dart';
import 'package:new_app/screens/onboarding/body_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const BodyBoarding(),
    );
  }
}

