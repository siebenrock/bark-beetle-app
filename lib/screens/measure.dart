import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circular_countdown/circular_countdown.dart';

import 'result.dart';
import '../static.dart';

class Measure extends StatefulWidget {
  @override
  _MeasureState createState() => _MeasureState();
}

class _MeasureState extends State<Measure> {
  ValueNotifier<bool> showCountdown = ValueNotifier<bool>(false);
  ValueNotifier<bool> showStart = ValueNotifier<bool>(true);

  void completeMeasure() {
    try {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
        return Result();
      }));
      Firestore.instance
          .collection('current_measure')
          .document('0')
          .updateData({'status': 'complete'});
      setState(() {
        showCountdown = ValueNotifier<bool>(false);
        showStart = ValueNotifier<bool>(false);
      });
      print("Firestore updated");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('current_measure')
                .document('0')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('Loading');
              Map<String, dynamic> documentFields = snapshot.data.data;
              if (documentFields["status"] == "measuring" ||
                  documentFields["status"] == "m") {
                Navigator.of(context).popUntil((route) => route.isFirst);
                showCountdown = ValueNotifier<bool>(true);
              } else {
                showCountdown = ValueNotifier<bool>(false);
              }
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(middle: Text("Messung")),
                child: SafeArea(
                  child: Visibility(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Messung läuft",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle),
                        Column(children: [
                          Text(
                              "Status: " + documentFields["status"].toString()),
                          Text("Infestation: " +
                              documentFields["infestation"].toString()),
                          Text(documentFields["duration"].toString() +
                              " Sekunden"),
                          Text(
                              "Notizen: " + documentFields["notes"].toString()),
                        ]),
                        TimeCircularCountdown(
                          unit: CountdownUnit.second,
                          countdownTotal: documentFields["duration"],
                          onFinished: () => {completeMeasure()},
                          countdownCurrentColor: CorporateColors.red,
                          countdownRemainingColor: CorporateColors.cream,
                          countdownTotalColor: CorporateColors.green,
                          textStyle: TextStyle(color: Colors.black),
                          gapFactor: 15,
                          diameter: 200,
                        ),
                      ],
                    ),
                    replacement: Center(
                      child: Text("Neue Messung starten"),
                    ),
                    visible: showCountdown.value,
                  ),
                ),
              );
            }));
  }
}
