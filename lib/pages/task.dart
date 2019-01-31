import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
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

  List<String> tasks = ['Things to make me happy', 'Caregiving'];

  void _toggleFavorite() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  Widget _buildTaskCard(context, index) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
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
              Text(
                tasks[index],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
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
                    'Morning coffee',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
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
        child: Column(
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
                    onTap: () => Navigator.pushNamed(context, '/calendar'),
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
                itemCount: tasks.length,
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
