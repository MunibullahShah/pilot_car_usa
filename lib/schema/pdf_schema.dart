import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pilot_car_usa/file_utils.dart';
import 'package:pilot_car_usa/schema/form_schema.dart';

class PDFSchema {
  final FormSchema schema;

  final doc = Document();

  PDFSchema(this.schema);

  Future<File> generatePdf() async {
    var _logo = PdfImage.file(
      doc.document,
      bytes: (await rootBundle.load('assets/logo.png')).buffer.asUint8List(),
    );
    doc.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        margin: EdgeInsets.fromLTRB(60, 30, 60, 30),
        build: (Context context) {
          return Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 180,
                      child: Image(_logo, fit: BoxFit.fill),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "ATTN: _________",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "OR FAX TO: _________",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "InvoiceNo: " + schema.invoiceNo,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Start Date: " +
                          (schema.startDate == null ? "___" : schema.startDate),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "End Date: " +
                          (schema.endDate == null ? "___" : schema.endDate),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "From: " +
                          (schema.from == null ? "________" : schema.from),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "To: " + (schema.to == null ? "_________" : schema.to),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Company Name: " +
                      (schema.companyName == null
                          ? "______________________________"
                          : "__" + schema.companyName + "__"),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Description of load" +
                      (schema.descriptionOfLoad == null
                          ? "________________________________"
                          : "__" + schema.descriptionOfLoad + "__"),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Driver Name: " +
                          (schema.driverName == null
                              ? "_____________"
                              : "__" + schema.driverName + "__"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Driver Phone: " +
                          (schema.phoneNumber == null
                              ? "___________"
                              : "__" + schema.phoneNumber + "__"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "CB Channel" +
                      (schema.CBChannel == null
                          ? "___________________________________"
                          : "__" + schema.CBChannel + "__"),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Trailer: " +
                          (schema.trailer == null
                              ? "_______________"
                              : "__" + schema.trailer + "__"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Truck: " +
                          (schema.truck == null
                              ? "________________"
                              : "__" + schema.truck + "__"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Freight Bill: " +
                          (schema.freightBill == null
                              ? "__________"
                              : "__" + schema.freightBill + "__"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Permit#: " +
                          (schema.permitNo == null
                              ? "_____________"
                              : "__" + schema.permitNo + "___"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: BoxBorder(
                      top: true,
                      bottom: true,
                      left: true,
                      right: true,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("High Pole Miles:", style: style),
                          Text(schema.highPoleX.toString() == null
                              ? "__________"
                              : "__" + schema.highPoleX.toString() + "__"),
                          Text("@", style: style),
                          Text(schema.hightPoleY.toString() == null
                              ? "__________"
                              : "__" + schema.hightPoleY.toString() + "__"),
                          Text("=", style: style),
                          Text(schema.highPoleResult.toString() == null
                              ? "__________"
                              : "__" + schema.highPoleResult.toString() + "__"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Lead Miles:", style: style),
                          Text(schema.leadMileX.toString() == null
                              ? "__________"
                              : "__" + schema.leadMileX.toString() + "__"),
                          Text("@", style: style),
                          Text(schema.leadMileY.toString() == null
                              ? "__________"
                              : "__" + schema.leadMileY.toString() + "__"),
                          Text("=", style: style),
                          Text(schema.leadMileResult.toString() == null
                              ? "__________"
                              : "__" + schema.leadMileResult.toString() + "__"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("OverNight:", style: style),
                          Text(schema.overNightX.toString() == null
                              ? "__________"
                              : "__" + schema.overNightX.toString() + "__"),
                          Text("@", style: style),
                          Text(schema.overNightY.toString() == null
                              ? "__________"
                              : "__" + schema.overNightY.toString() + "__"),
                          Text("=", style: style),
                          Text(schema.overNightresult.toString() == null
                              ? "__________"
                              : "__" +
                                  schema.overNightresult.toString() +
                                  "__"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Day Rate:", style: style),
                          Text(schema.dayRateX.toString() == null
                              ? "__________"
                              : "__" + schema.dayRateX.toString() + "__"),
                          Text("@", style: style),
                          Text(schema.dayRateY.toString() == null
                              ? "__________"
                              : "__" + schema.dayRateY.toString() + "__"),
                          Text("=", style: style),
                          Text(schema.dayRateResult.toString() == null
                              ? "__________"
                              : "__" + schema.dayRateResult.toString() + "__"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("No Go:", style: style),
                          Text(schema.noGoX.toString() == null
                              ? "__________"
                              : "__" + schema.noGoX.toString() + "__"),
                          Text("@", style: style),
                          Text(schema.noGoY.toString() == null
                              ? "__________"
                              : "__" + schema.noGoY.toString() + "__"),
                          Text("=", style: style),
                          Text(schema.noGoResult.toString() == null
                              ? "__________"
                              : "__" + schema.noGoResult.toString() + "__"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Detention:", style: style),
                          Text(schema.detentionX.toString() == null
                              ? "__________"
                              : "__" + schema.detentionX.toString() + "__"),
                          Text("Hours/s:", style: style),
                          Text(schema.detentionHour.toString() == null
                              ? "__________"
                              : "__" + schema.detentionHour.toString() + "__"),
                          Text("@", style: style),
                          Text(schema.detentionY.toString() == null
                              ? "__________"
                              : "__" + schema.detentionY.toString() + "__"),
                          Text("=", style: style),
                          Text(schema.detentionResult.toString() == null
                              ? "__________"
                              : "__" +
                                  schema.detentionResult.toString() +
                                  "__"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Chase Miles:", style: style),
                          Text(schema.chaseMilesX.toString() == null
                              ? "__________"
                              : "__" + schema.chaseMilesX.toString() + "__"),
                          Text("@", style: style),
                          Text(schema.chaseMilesY.toString() == null
                              ? "__________"
                              : "__" + schema.chaseMilesY.toString() + "__"),
                          Text("=", style: style),
                          Text(schema.chaseMilesResult.toString() == null
                              ? "__________"
                              : "__" +
                                  schema.chaseMilesResult.toString() +
                                  "__"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Escort Driver: " +
                      (schema.escortDriver == null
                          ? "__________________________"
                          : "__" + schema.escortDriver + "__"),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Driver: " +
                      (schema.driver == null
                          ? "_____________________________"
                          : "__" + schema.driver + "__"),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Remarks: " +
                      (schema.remarks == null
                          ? "________________________"
                          : "__" + schema.remarks + "__"),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Signature: " + "________________________",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }));

    final File file = await FileUtils.localFile(schema.invoiceNo);
    await file.writeAsBytes(doc.save());
    return file;
  }

  TextStyle style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
