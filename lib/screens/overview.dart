import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'listBox.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
        ListBox(),
      ],
      scrollDirection: Axis.vertical,
    ));
  }
}
