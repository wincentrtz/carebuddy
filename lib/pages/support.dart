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
        child: SingleChildScrollView(
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
              Container(
                margin: EdgeInsets.all(40.0),
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: const Alignment(1.1, -1.3),
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/support-detail');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            ),
                          ),
                        ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: const Alignment(1.1, -1.3),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
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
                          ),
                        ),
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
                    SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment(0.8,
                                0.0), // 10% of the width, so there are ten blinds.
                            colors: [
                              Color(0xFF714f9f),
                              Color(0xFF393b54)
                            ], // whitish to gray
                            tileMode: TileMode
                                .clamp, // repeats the gradient over the canvas
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        width: deviceWidth * 0.50,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          'Find Groups Near You',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
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
