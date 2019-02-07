import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MoodTrendPage extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  MoodTrendPage(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: deviceWidth,
              decoration: BoxDecoration(
                color: Color(0xFF1a4687),
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
                    margin: EdgeInsets.only(left: 44.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Februari',
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '2019',
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 200,
                width: 400,
                child: charts.BarChart(
                  seriesList,
                  animate: animate,
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1a4687),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(10.0),
                    width: deviceWidth,
                    margin: EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 60.0,
                    ),
                    child: Text(
                      'Share with others',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
