import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskPage extends StatefulWidget {
  List<Task> taskHeaders;
  Function getUserHeaderTask;

  TaskPage(this.taskHeaders, this.getUserHeaderTask);

  List<String> keys;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskPageState();
  }
}

class _TaskPageState extends State<TaskPage> {
  @override
  bool _isChecked = false;
  bool _snackbar = false;

  DateTime today = DateTime.now();

  var todayKey;

  var keys = [];

  int totalTask = 0;

  List<String> months = [
    'JANUARI',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER'
  ];

  @override
  void initState() {
    if (widget.taskHeaders == null) {
      todayKey = today.day.toString() +
          ' ' +
          months[today.month - 1] +
          ' ' +
          today.year.toString();
      widget.getUserHeaderTask();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    String dateKey = today.year.toString() +
        '-' +
        today.month.toString() +
        '-' +
        today.day.toString();
    int count = 0;
    for (var i = 0; i < widget.taskHeaders.length; i++) {
      if (widget.taskHeaders[i].taskDetails[dateKey] != null) {
        count += widget.taskHeaders[i].taskDetails[dateKey].length;
      }
    }
    setState(() {
      totalTask = count;
    });
  }

  Widget _buildTaskCard(context, index) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/task-header/' + index.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        width: deviceWidth * 0.75,
        margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.taskHeaders[index].taskTitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                        widget.taskHeaders[index].generateColorFromString(
                            widget.taskHeaders[index].taskColorTheme),
                      ),
                    ),
                    width: 20.0,
                    height: 20.0,
                  ),
                ],
              ),
              Text(
                'Click Here To See More',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 0.0),
            colors: [Color(0xFF25263b), Color(0xFF714f9f)],
            tileMode: TileMode.clamp,
          ),
        ),
        child: widget.taskHeaders == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 44.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'DAILY TASKS',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'You Have ' +
                                  totalTask.toString() +
                                  ' tasks today',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              todayKey.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/calendar'),
                          child: Image.asset(
                            'assets/calendar.png',
                            width: 64.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: _buildTaskCard,
                      itemCount: widget.taskHeaders.length,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add-task-detail');
                      },
                      backgroundColor: Color(0xFF09a24a),
                      child: Icon(Icons.add),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0, top: 10.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Add New Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
