import 'package:flutter/material.dart';
import 'package:pilot_car_usa/widgets/custom_drawer.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: custom_drawer(),
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Container(),
    );
  }
}
