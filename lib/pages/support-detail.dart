import 'package:flutter/material.dart';

class SupportDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'assets/mood.png',
                  ),
                ),
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
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Text(
                    'Sebuah komunitas caregiver di Pluit yang bertujuan mensejahterakan seluruh anggota dan keluarga yang terkasih.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Members (21)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFed2e2d),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFed2e2d),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFed2e2d),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFed2e2d),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFed2e2d),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 20),
                  ),
                  Text(
                    'Latest Event',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Group Sharing 6',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text('Saturday, 26 January 2019'),
                  Text('Devinaʼs Coffee and Office,'),
                  Text('Jl. Pluit Selatan Raya No 2, Jakarta Utara'),
                  Text(
                    'Open location in Maps',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Threads',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Container(
                        width: 3,
                        color: Colors.black,
                        height: 100,
                      ),
                      Text(
                        'Albums',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
