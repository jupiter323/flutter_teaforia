import 'package:flutter/material.dart';

class Fourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.airport_shuttle,
              size: 160.0,
              color: Colors.blue,
            ),
            new Text("Fourth Tab")
          ],
        ),
      ),
    );
  }
}
