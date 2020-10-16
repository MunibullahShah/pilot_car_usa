import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pilot_car_usa/database_helper.dart';
import 'package:pilot_car_usa/file_utils.dart';
import 'package:pilot_car_usa/widgets/custom_drawer.dart';
import 'package:sqflite/sqflite.dart';

import 'PDF_view_screen.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DatabaseHelper db = DatabaseHelper();
  List<String> filesList;
  int count;
  @override
  Widget build(BuildContext context) {
    if (filesList == null) {
      filesList = List<String>();
      updateCustomerList();
    }
    DatabaseHelper db = DatabaseHelper();
    return Scaffold(
      drawer: custom_drawer(),
      appBar: AppBar(
        title: Text("History"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    File file = await FileUtils.localFile(filesList[index]);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PFDView(
                        file: file,
                        invoice: filesList[index],
                      );
                    }));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 5.0,
                                  ),
                                  borderRadius: BorderRadius.circular(6)),
                              child: ListTile(
                                title: Text(filesList[index]),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: filesList.length,
            ),
          ),
        ],
      ),
    );
  }

  void updateCustomerList() {
    final Future<Database> dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<String>> pdfListFuture = db.getPDF();
      pdfListFuture.then((pdfList) {
        setState(() {
          this.filesList = pdfList;
          this.count = filesList.length;
        });
      });
    });
  }
}
