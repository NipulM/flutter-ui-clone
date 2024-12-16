import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/store.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // if you wanna see the profile screen uncomment the line below :)
      // home: const ProfileScreen(),

      // if you wanna see the store screen uncomment the line below :)
      home: const StoreScreen(),
    );
  }
}
