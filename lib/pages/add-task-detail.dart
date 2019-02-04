import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/task.dart';
import '../models/task-detail.dart';

class AddTaskDetailPage extends StatefulWidget {
  Task task = null;
  Function addTaskHeader;

  AddTaskDetailPage({this.addTaskHeader, this.task});

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

  var keys;

  List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  ValueChanged<Color> onColorChanged;
  final GlobalKey<FormState> _addTaskDetailFormKey = GlobalKey<FormState>();

  changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void _showDialogCreate() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text("Adding New Task..."),
          actions: <Widget>[],
        );
      },
    );
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
  void initState() {
    if (widget.task != null) keys = widget.task.taskDetails.keys.toList();
    super.initState();
  }

  Widget _buildListJob(context, index, k) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/circle.png'),
          radius: 10.0,
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          widget.task.taskDetails[keys[k]][index].taskName,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget _formatDate(String date) {
    List<String> dateArr = date.split('-');
    var today = DateTime.now();

    String finalFormat = "";
    if (dateArr[1] == "daily") {
      finalFormat = "Daily";
    } else {
      if (today.day == int.parse(dateArr[2]) &&
          today.month == int.parse(dateArr[1]) &&
          today.year == int.parse(dateArr[0])) {
        finalFormat = "Today";
      } else {
        finalFormat = dateArr[2] +
            ' ' +
            months[int.parse(dateArr[1]) - 1] +
            ' ' +
            dateArr[0];
      }
    }

    return Text(
      finalFormat,
      style: TextStyle(
        color: Color(
          widget.task.generateColorFromString(widget.task.taskColorTheme),
        ),
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  Widget _buildListTaskDetail(context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _formatDate(keys[index]),
        SizedBox(
          height: 20.0,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctxt, idx) => _buildListJob(ctxt, idx, index),
          itemCount: widget.task.taskDetails[keys[index]].length,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        color: widget.task == null
                            ? Color(0xFF09a24a)
                            : Color(
                                widget.task.generateColorFromString(
                                    widget.task.taskColorTheme),
                              ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 40,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _showDialogCreate();
                          Future.delayed(const Duration(milliseconds: 500), () {
                            _addTaskDetailFormKey.currentState.save();
                            widget.addTaskHeader(task);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        },
                        child: widget.task == null
                            ? Text(
                                'Apply',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container(),
                      ),
                    ),
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
                        initialValue:
                            widget.task == null ? "" : widget.task.taskTitle,
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
                                color: widget.task == null
                                    ? currentColor
                                    : Color(
                                        widget.task.generateColorFromString(
                                            widget.task.taskColorTheme),
                                      ),
                              ),
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                        ],
                      ),
                      widget.task != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: _buildListTaskDetail,
                              itemCount: widget.task.taskDetails.length,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: widget.task == null
          ? Container()
          : FloatingActionButton(
              onPressed: () => Navigator.pushNamed(
                  context, '/add-task/' + widget.task.id.toString()),
              backgroundColor: widget.task == null
                  ? Color(0xFF09a24a)
                  : Color(
                      widget.task
                          .generateColorFromString(widget.task.taskColorTheme),
                    ),
              child: Icon(Icons.add),
            ),
    );
  }
}
