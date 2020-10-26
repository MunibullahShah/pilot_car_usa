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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Container(
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.blue),
            //       borderRadius: BorderRadius.circular(8)),
            //   child: ListTile(
            //     title: Center(
            //       child: Text(
            //         'Log Out',
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (context) {
            //         return SigningScreen();
            //       }));
            //     },
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
