import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [Color(0xFFf05e70), Color(0xFFef7c5a)], // whitish to gray
            tileMode: TileMode.clamp, // repeats the gradient over the canvas
          ),
        ),
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
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 60.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.0),
                  child: Column(
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        backgroundColor: Color(0xFF894345),
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'CREATE A \n GROUP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'SUPPORT GROUP',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Join support group around you!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 72.0,
                  ),
                  Text(
                    'YOUR GROUPS :',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Stack(
                    alignment: const Alignment(1.1, -1),
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.only(
                            left: 20.0,
                            bottom: 60.0,
                            top: 20.0,
                            right: 20.0,
                          ),
                          width: deviceWidth * 0.75,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Pluit Caregiving Community',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Pluit, Jakarta Utara')
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/mood.png',
                                ),
                              ),
                            ],
                          )),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFed2e2d),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
