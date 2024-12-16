// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

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
          colorScheme: ColorScheme.light(
            primary: Colors.blue, // Customize your primary color
            secondary: Colors.amber, // Customize your secondary color
          ),
          useMaterial3:
              true, // Optional if you want to use Material 3 components
        ),
        home: MyHomePage());
  }
}
