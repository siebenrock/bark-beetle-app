import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            color: Color.fromRGBO(121, 158, 106, 1),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Messergebnis'),
          ),
        ),
      ),
    );
  }
}
