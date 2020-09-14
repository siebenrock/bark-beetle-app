import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../static.dart';
import 'result.dart';

class ListBox extends StatefulWidget {
  final MeasureData currentMeasureData;

  const ListBox({Key key, @required this.currentMeasureData}) : super(key: key);

  @override
  _ListBoxState createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  @override
  Widget build(BuildContext context) {
    final int infestation = widget.currentMeasureData.infestation;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: GestureDetector(
        onTap: () {
          print("clicked");
          Navigator.push(
            context,
            new CupertinoPageRoute(
              builder: (context) => Result(
                currentMeasureData: widget.currentMeasureData,
              ),
            ),
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: infestation > 40
                  ? CorporateColors.red
                  : (infestation == 0
                      ? CorporateColors.green
                      : CorporateColors.orange),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.currentMeasureData.timestamp}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${widget.currentMeasureData.location}",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Icon(
                    infestation > 40
                        ? FontAwesomeIcons.exclamationCircle
                        : (infestation == 0
                            ? FontAwesomeIcons.solidCheckCircle
                            : FontAwesomeIcons.binoculars),
                    color: Colors.white,
                    size: 36,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
