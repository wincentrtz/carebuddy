import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              pinned: true,
              expandedHeight: 150.0,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 40.0,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              actions: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                    Text('Create a\n group')
                  ],
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SUPPORT GROUP'),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
