import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'add');
                    },
                    child: FlatButton(
                      child: Text('Add'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'What tasks are you planning to do?',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
