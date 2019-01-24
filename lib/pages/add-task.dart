import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTaskPageState();
  }
}

class _AddTaskPageState extends State<AddTaskPage> {
  bool _timeOption = false;

  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/cross.png',
                      width: 20.0,
                    ),
                  ),
                  Text(
                    'New Task',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  FlatButton(
                    child: Text('Add'),
                    onPressed: () => Navigator.pop(context, 'add'),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'What tasks are you planning to do?',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      maxLines: 4,
                    ),
                    ListTile(
                      leading: Text('Time'),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            _timeOption = !_timeOption;
                          });
                        },
                        child: _timeOption
                            ? Icon(
                                Icons.radio_button_checked,
                                size: 30.0,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.radio_button_unchecked,
                                size: 30.0,
                                color: Colors.black,
                              ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 5.0,
                    ),
                    _timeOption
                        ? DateTimePickerFormField(
                            inputType: inputType,
                            format: formats[inputType],
                            editable: editable,
                            decoration: InputDecoration(
                                labelText: 'Date/Time',
                                hasFloatingPlaceholder: false),
                            onChanged: (dt) => setState(() => date = dt),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
