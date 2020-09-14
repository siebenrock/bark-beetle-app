import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Karte")),
      child: SafeArea(
        child: Container(
          child: Center(
            child: Text("Karte"),
          ),
        ),
      ),
    );
  }
}
