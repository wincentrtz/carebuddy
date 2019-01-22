import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  @override
  final String productTitle;
  final int indexArticle;

  ArticleDetailPage(this.productTitle, this.indexArticle);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.keyboard_arrow_left),
          iconSize: 40.0,
        ),
        backgroundColor: Color(0xFF50c2c3),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productTitle,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF50c2c3),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                )),
            Image.asset('assets/article.jpg'),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                '         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    '\n\n'
                    '       Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod' +
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
