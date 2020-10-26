import 'package:flutter/material.dart';
import 'package:pilot_car_usa/Screens/form_screen.dart';

import 'Screens/signing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pilot Car USA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormScreen(),
      //home: SigningScreen(title: 'Pilot Car USA'),
    );
  }
}
