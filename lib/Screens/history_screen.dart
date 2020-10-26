import 'dart:io';

import 'package:flutter/material.dart';
import 'file:///F:/Fiverr%20Orders/pilot_car_usa/lib/utils/database_helper.dart';
import 'file:///F:/Fiverr%20Orders/pilot_car_usa/lib/utils/file_utils.dart';
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

  @override
  void initState() {
    if (filesList == null) {
      filesList = List<String>();
      updateCustomerList("");
    }
  }

  int count;
  @override
  Widget build(BuildContext context) {
    DatabaseHelper db = DatabaseHelper();
    return Scaffold(
      drawer: custom_drawer(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(37, 10, 0, 5),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            width: 200,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  updateCustomerList(value);
                });
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Search",
                alignLabelWithHint: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
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
                        edit: true,
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
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey,
                                    offset: new Offset(5.0, 0.0),
                                    blurRadius: 10.0,
                                  )
                                ],
                                border: new Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
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

  void updateCustomerList(String search) {
    Future<List<String>> pdfListFuture;
    final Future<Database> dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      if (search == "") {
        pdfListFuture = db.getPDF();
      } else {
        search = "%" + search + "%";
        pdfListFuture = db.getSearchedpdf(search);
      }
      pdfListFuture.then((pdfList) {
        setState(() {
          this.filesList = pdfList;
          this.count = filesList.length;
        });
      });
    });
  }
}
