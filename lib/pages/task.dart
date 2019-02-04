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

  @override
  void initState() {
    // TODO: implement initState

    if (widget.taskHeaders == null) {
      todayKey = today.year.toString() +
          '-' +
          today.month.toString() +
          '-' +
          today.day.toString();
      widget.getUserHeaderTask();
    }
    super.initState();
  }

  void _toggleFavorite() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  Widget _buildTaskList(context, index, k) {
    return widget.taskHeaders[index].taskDetails['0-daily'][k] != null
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Stack(
                    alignment: const Alignment(-1.2, 1.2),
                    children: [
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/circle.png'),
                          radius: 15.0,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      (_isChecked
                          ? GestureDetector(
                              onTap: _toggleFavorite,
                              child: Container(
                                child: Image.asset(
                                  'assets/check.png',
                                  width: 30.0,
                                ),
                              ),
                            )
                          : Container()),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    widget
                        .taskHeaders[index].taskDetails['0-daily'][0].taskName,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ],
          )
        : Container();
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
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctxt, idx) => _buildTaskList(ctxt, idx, index),
                itemCount: widget.taskHeaders[index].taskDetails['0-daily'] !=
                        null
                    ? widget.taskHeaders[index].taskDetails['0-daily'].length
                    : 0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    final double deviceHeigth = MediaQuery.of(context).size.height;
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
                              'You Have 3 tasks today',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'TUESDAY, 1 JANUARY 2019',
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
