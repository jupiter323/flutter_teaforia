import 'package:flutter/material.dart';

class AllRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[        
            new Text("AllRecipes")
          ],
        ),
      ),
    );
  }
}
