import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:pilot_car_usa/Screens/form_screen.dart';
import 'file:///F:/Fiverr%20Orders/pilot_car_usa/lib/utils/database_helper.dart';
import 'package:printing/printing.dart';
import 'package:share/share.dart';

class PFDView extends StatefulWidget {
  final File file;
  final String invoice;
  bool edit = false;

  PFDView({
    Key key,
    this.file,
    this.invoice,
    this.edit,
  }) : super(key: key);

  @override
  _PFDViewState createState() => _PFDViewState();
}

class _PFDViewState extends State<PFDView> {
  DatabaseHelper db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: null,
            actions: [
              widget.edit == true
                  ? IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FormScreen.edit(
                            invoice: widget.invoice,
                          );
                        }));
                      },
                    )
                  : SizedBox(
                      width: 5,
                    ),
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    share(context, widget.file);
                  }),
              IconButton(
                  icon: Icon(Icons.print),
                  onPressed: () async {
                    await Printing.layoutPdf(
                        onLayout: (PdfPageFormat format) async =>
                            widget.file.readAsBytes());
                  }),
            ],
          ),
          bottomNavigationBar: ButtonBar(
            buttonHeight: 40,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text('Done'),
                  onPressed: () async {
                    save();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FormScreen();
                    }));
                  },
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey,
          body: Container(
              alignment: Alignment.center,
              child: PDF.file(
                widget.file,
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width - 40,
              ))),
    );
  }

  share(BuildContext context, File file) {
    final RenderBox box = context.findRenderObject();

    Share.shareFiles(["${file.path}"],
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  void save() async {
    bool result;
    result = (await db.insertPDF(widget.invoice) != 0 ? true : false);
    if (result == true) {
      print("Successsssssssssssssssssss");
    } else {}
  }

  // void share(BuildContext context, File file) {
  //   final RenderBox box = context.findRenderObject();
  //
  //   Share.shareFiles([file.path],
  //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  // }
}
