import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              title: Text('Support Group'),
            ),
          ),
        ],
      ),
    );
  }
}
