import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot_car_usa/schema/pdf_schema.dart';
import 'PDF_view_screen.dart';
import 'package:pilot_car_usa/schema/form_schema.dart';
import 'package:pilot_car_usa/widgets/custom_drawer.dart';
import 'package:pilot_car_usa/widgets/custom_text_field.dart';
import 'package:pilot_car_usa/widgets/input_column_widget.dart';

class FormScreen extends StatefulWidget {
  String invoice = "";
  FormScreen();
  FormScreen.edit({Key key, this.invoice}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  DateTime curDate = DateTime.now();

  FocusNode startDateNode;
  FocusNode endDateNode;
  FocusNode fromNode;
  FocusNode toNode;
  FocusNode companyNameNode;
  FocusNode descriptionNode;
  FocusNode driverNameNode;
  FocusNode phoneNode;
  FocusNode cbNode;
  FocusNode trailerNode;
  FocusNode truckNode;
  FocusNode freightBillNode;
  FocusNode permitNode;

  FocusNode highPoleXNode;
  FocusNode highPoleYNode;
  FocusNode leadMileXNode;
  FocusNode leadMileYNode;
  FocusNode overNightXNode;
  FocusNode overNightYNode;
  FocusNode dayRateXNode;
  FocusNode dayRateYNode;
  FocusNode noGoXNode;
  FocusNode noGoYNode;
  FocusNode detentionXNode;
  FocusNode detentionHourNode;
  FocusNode detentionYNode;
  FocusNode chaseMilesXNode;
  FocusNode chaseMilesYNode;

  FocusNode escortDriverNode;
  FocusNode driverNode;
  FocusNode remarkNode;
  FormSchema schema;
  PDFSchema pdfSchema;

  @override
  void initState() {
    schema = FormSchema();
    schema.startDate =
        "${curDate.month.toString()}/${curDate.day.toString()}/${curDate.year.toString()}";
    schema.endDate =
        "${curDate.month.toString()}/${curDate.day.toString()}/${curDate.year.toString()}";
    widget.invoice == ""
        ? schema.invoiceNo = "36-"
        : schema.invoiceNo = widget.invoice;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      bottomNavigationBar: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 150,
            child: RaisedButton(
              color: Colors.blue,
              child: Text('Save'),
              onPressed: () async {
                pdfSchema = PDFSchema(schema);
                File file = await pdfSchema.generatePdf();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PFDView(
                    file: file,
                    invoice: schema.invoiceNo,
                  );
                }));
              },
            ),
          ),
        ],
      ),
      drawer: custom_drawer(),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    child: widget.invoice == ""
                        ? CustomTextField(
                            keyboardType: TextInputType.datetime,
                            focusNode: startDateNode,
                            onFieldSubmitted: (value) {
                              schema.invoiceNo == "36-"
                                  ? schema.invoiceNo =
                                      "${schema.invoiceNo}$value"
                                  : schema.invoiceNo = schema.invoiceNo;
                              CustomTextField.fieldFocusChange(
                                context,
                                startDateNode,
                                endDateNode,
                              );
                            },
                            label: 'Invoice No.',
                            hintText: '${schema.invoiceNo}',
                            textInputAction: TextInputAction.next,
                          )
                        : Text(
                            "Edit form by entering all the details again\n(Except Invoice Number)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Start Date",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          child: Center(
                            child: Text(
                              schema.startDate,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2025))
                                .then((date) {
                              setState(() {
                                schema.startDate = date.day.toString() +
                                    "/" +
                                    date.month.toString() +
                                    "/" +
                                    date.year.toString();
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "End Date",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          child: Center(
                            child: Text(
                              schema.endDate,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2025))
                                .then((date) {
                              setState(() {
                                schema.endDate = date.day.toString() +
                                    "/" +
                                    date.month.toString() +
                                    "/" +
                                    date.year.toString();
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.from = value;
                      },
                      focusNode: endDateNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                            context, fromNode, toNode);
                      },
                      label: 'From',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.to = value;
                      },
                      label: 'To',
                      hintText: '',
                      focusNode: toNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                            context, toNode, companyNameNode);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.companyName = value;
                      },
                      label: 'Name of the Company',
                      hintText: '',
                      focusNode: companyNameNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                            context, companyNameNode, descriptionNode);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.descriptionOfLoad = value;
                      },
                      label: 'Description of Load',
                      hintText: '',
                      focusNode: descriptionNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                            context, descriptionNode, driverNameNode);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.driverName = value;
                      },
                      label: 'Driver\'s Name',
                      hintText: '',
                      focusNode: driverNameNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                            context, driverNameNode, phoneNode);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.phoneNumber = value;
                      },
                      label: 'Driver\'s Phone',
                      focusNode: phoneNode,
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.CBChannel = value;
                      },
                      label: 'CB Channel',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.trailer = value;
                      },
                      label: 'Trailer',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.truck = value;
                      },
                      label: 'Truck',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.freightBill = value;
                      },
                      label: 'Freight Bill',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.permitNo = value;
                      },
                      label: 'Permit',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  input_column_widget(
                    title: "High Pole Miles",
                    onChanged1: (value) {
                      schema.highPoleX = int.parse(value);
                    },
                    onChanged2: (value) {
                      schema.hightPoleY = int.parse(value);
                      schema.highPoleResult =
                          schema.highPoleX * schema.hightPoleY;
                    },
                    onFieldSubmitted: (value) {
                      schema.highPoleResult =
                          schema.highPoleX * schema.hightPoleY;
                      setState(() {});
                    },
                    result: schema.highPoleResult,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  input_column_widget(
                    title: "Lead Miles",
                    onChanged1: (value) {
                      schema.leadMileX = int.parse(value);
                    },
                    onChanged2: (value) {
                      schema.leadMileY = int.parse(value);
                    },
                    onFieldSubmitted: (value) {
                      schema.leadMileResult =
                          schema.leadMileX * schema.leadMileY;
                      setState(() {});
                    },
                    result: schema.leadMileResult,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  input_column_widget(
                    title: "OverNight",
                    onChanged1: (value) {
                      schema.overNightX = int.parse(value);
                    },
                    onChanged2: (value) {
                      schema.overNightY = int.parse(value);
                    },
                    onFieldSubmitted: (value) {
                      schema.overNightresult =
                          schema.overNightX * schema.overNightY;
                      setState(() {});
                    },
                    result: schema.overNightresult,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  input_column_widget(
                    title: "DayRate",
                    onChanged1: (value) {
                      schema.dayRateX = int.parse(value);
                    },
                    onChanged2: (value) {
                      schema.dayRateY = int.parse(value);
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        schema.dayRateResult =
                            schema.dayRateX * schema.dayRateY;
                      });
                    },
                    result: schema.dayRateResult,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  input_column_widget(
                    title: "No Go",
                    onChanged1: (value) {
                      schema.noGoX = int.parse(value);
                    },
                    onChanged2: (value) {
                      schema.noGoY = int.parse(value);
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        schema.noGoResult = schema.noGoX * schema.noGoY;
                      });
                    },
                    result: schema.noGoResult,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  input_column_widget(
                    title: "Detention",
                    onChanged1: (value) {
                      schema.detentionX = int.parse(value);
                    },
                    onChanged2: (value) {
                      schema.detentionY = int.parse(value);
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        schema.detentionResult =
                            schema.detentionX * schema.detentionY;
                      });
                    },
                    result: schema.detentionResult,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  input_column_widget(
                    title: "Chase Miles",
                    onChanged1: (value) {
                      schema.chaseMilesX = int.parse(value);
                    },
                    onChanged2: (value) {
                      schema.chaseMilesY = int.parse(value);
                    },
                    onFieldSubmitted: (value) {
                      schema.chaseMilesResult =
                          schema.chaseMilesX * schema.chaseMilesY;
                      setState(() {});
                    },
                    result: schema.chaseMilesResult,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.escortDriver = value;
                      },
                      label: 'Escort Driver',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.driver = value;
                      },
                      label: 'Driver',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.remarks = value;
                      },
                      label: 'Remarks',
                      hintText: '',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
