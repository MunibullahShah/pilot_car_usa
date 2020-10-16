import 'package:flutter/material.dart';
import 'package:pilot_car_usa/Screens/form_screen.dart';
import 'package:pilot_car_usa/Screens/history_screen.dart';
import 'package:pilot_car_usa/Screens/signing_screen.dart';

class custom_drawer extends StatelessWidget {
  const custom_drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                'We Pay Quickly',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Center(
              child: Text(
                'Invoice',
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return FormScreen();
              }));
            },
          ),
          ListTile(
            title: Center(
              child: Text(
                'History',
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HistoryScreen();
              }));
            },
          ),
          ListTile(
            title: Center(
              child: Text(
                'Log Out',
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return SigningScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
