import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddTaskDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTaskDetailPageState();
  }
}

class _AddTaskDetailPageState extends State<AddTaskDetailPage> {
  // create some value
  Map<String, dynamic> task = {
    'taskTitle': null,
    'taskColorTheme': null,
  };

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  ValueChanged<Color> onColorChanged;
  final GlobalKey<FormState> _addTaskDetailFormKey = GlobalKey<FormState>();

  changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  _createTaskHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId');

    await http.post(
        'https://care-buddy-793cb.firebaseio.com/header-task/' +
            userId +
            '/.json',
        body: json.encode(task));

    Navigator.pop(context);
  }

  void _showDialog() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            enableLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Got it'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Form(
          key: _addTaskDetailFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 60.0,
                      color: Color(0xFF09a24a),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        right: 40,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _addTaskDetailFormKey.currentState.save();
                          _createTaskHeader();
                        },
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Reminder!',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      onSaved: (String value) {
                        task['taskTitle'] = value;
                        task['taskColorTheme'] = currentColor.toString();
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Color Theme',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showDialog();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColor,
                            ),
                            width: 30.0,
                            height: 30.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pushNamed(context, '/add-task'),
      //   backgroundColor: Color(0xFF09a24a),
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
