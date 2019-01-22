import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  @override
  List<String> articles = ['Article 1', 'Article 2', 'Article 3'];
  List<String> articlesOld = [
    'Article 4',
    'Article 5',
    'Article 6',
    'Article 7',
    'Article 8',
    'Article 9',
    'Article 10',
  ];

  Widget _buildArticleCard(context, index) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: deviceWidth * 0.8,
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/article.jpg'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      articles[index],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Description about the article and need a i...',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleListTile(BuildContext context, index) {
    return Container(
      margin: EdgeInsets.only(
        top: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articlesOld[index],
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Description About...',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/article.jpg',
                width: 120,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    final double deviceHeigth = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFF50c2c3),
            pinned: true,
            expandedHeight: 150.0,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 40.0,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Articles'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 250.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: _buildArticleCard,
                  itemCount: articles.length,
                ),
              ),
              ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: _buildArticleListTile,
                itemCount: articlesOld.length,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
