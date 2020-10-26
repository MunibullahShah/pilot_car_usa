import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot_car_usa/utils/theme.dart';

class input_column_widget extends StatefulWidget {
  final String title;
  void Function(String) onChanged1;
  void Function(String) onChanged2;
  Function(String) onFieldSubmitted;
  TextInputAction textInputAction;
  int result = 0;

  input_column_widget(
      {this.title,
      this.onChanged1,
      this.onChanged2,
      this.result,
      this.textInputAction,
      this.onFieldSubmitted});

  @override
  _input_column_widgetState createState() => _input_column_widgetState();
}

class _input_column_widgetState extends State<input_column_widget> {
  FocusNode focusNode1;

  FocusNode focusNode2;

  FocusNode nextNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.LIGHT_COLOR,
        border: Border.all(color: CustomTheme.PRIMARY_LIGHT_COLOR),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.result == null ? "" : widget.result.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    textInputAction: widget.textInputAction,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    autofocus: true,
                    onChanged: widget.onChanged1,
                    focusNode: focusNode1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  width: 100,
                  height: 35,
                ),
                Center(
                  child: Text(
                    "@ ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    textInputAction: widget.textInputAction,
                    focusNode: focusNode2,
                    onChanged: widget.onChanged2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  width: 100,
                  height: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
