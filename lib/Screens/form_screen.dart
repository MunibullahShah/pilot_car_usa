import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot_car_usa/schema/form_schema.dart';
import 'package:pilot_car_usa/widgets/custom_drawer.dart';
import 'package:pilot_car_usa/widgets/custom_text_field.dart';
import 'package:pilot_car_usa/widgets/input_column_widget.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var curDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    FormSchema schema = FormSchema();
    schema.startDate =
        "${curDate.day.toString()}/${curDate.month.toString()}/${curDate.year.toString()}";
    schema.invoiceNo =
        "36${curDate.day.toString()}${curDate.month.toString()}${curDate.year.toString()}";
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
              onPressed: () {},
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
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.invoiceNo = value;
                      },
                      keyboardType: TextInputType.datetime,
                      focusNode: startDateNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                          context,
                          startDateNode,
                          endDateNode,
                        );
                      },
                      label: 'Invoice No.',
                      hintText: '${schema.invoiceNo}',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.startDate = value;
                      },
                      keyboardType: TextInputType.datetime,
                      focusNode: startDateNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                          context,
                          startDateNode,
                          endDateNode,
                        );
                      },
                      label: 'Start Date',
                      hintText: '${schema.startDate}',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: CustomTextField(
                      onChanged: (value) {
                        schema.endDate = value;
                      },
                      keyboardType: TextInputType.datetime,
                      focusNode: endDateNode,
                      onFieldSubmitted: (value) {
                        CustomTextField.fieldFocusChange(
                          context,
                          endDateNode,
                          toNode,
                        );
                      },
                      label: 'End Date',
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
                      label: 'Dirver\'s Phone',
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
                      schema.dayRateResult = schema.dayRateX * schema.dayRateY;
                      setState(() {});
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
                      schema.noGoResult = schema.noGoX * schema.noGoY;
                      setState(() {});
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
                      schema.detentionResult =
                          schema.detentionX * schema.detentionY;
                      setState(() {});
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
