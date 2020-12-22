import '../static.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circular_countdown/circular_countdown.dart';

import 'result.dart';

class Measure extends StatefulWidget {
  @override
  _MeasureState createState() => _MeasureState();
}

class _MeasureState extends State<Measure> {
  ValueNotifier<bool> showCountdown = ValueNotifier<bool>(false);

  MeasureData currentMeasureData = new MeasureData(
    infestation: 0,
    timestamp: "15. Sep 2020",
    location: "Lichtenbergstraße 6, Garching",
    temperature: 27.0,
    humidity: 71.6,
    notes: "Lorem ipsum",
  );

  void completeMeasure(infestation) {
    try {
      Firestore.instance
          .collection('current_measure')
          .document('0')
          .updateData({'status': 'complete'});
      print("Firestore updated");
    } catch (e) {
      print(e.toString());
    } finally {
      currentMeasureData.infestation = infestation;
      Navigator.push(
        context,
        new CupertinoPageRoute(
          builder: (context) => Result(
              currentMeasureData: currentMeasureData, previousTitle: "Messung"),
        ),
      );
    }
  }

  void startMeasure(infestation) {
    try {
      Firestore.instance
          .collection('current_measure')
          .document('0')
          .updateData({'status': 'measuring', 'infestation': infestation});
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                    child: Visibility(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Messung läuft",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navLargeTitleTextStyle),
/*                           Column(children: [
                            Text("Status: " +
                                documentFields["status"].toString()),
                            Text("Infestation: " +
                                documentFields["infestation"].toString()),
                            Text(documentFields["duration"].toString() +
                                " Sekunden"),
                            Text("Notizen: " +
                                documentFields["notes"].toString()),
                          ]), */
                          Column(children: [
                            TimeCircularCountdown(
                              unit: CountdownUnit.second,
                              countdownTotal: documentFields["duration"],
                              onFinished: () => completeMeasure(
                                  documentFields["infestation"]),
                              countdownCurrentColor: CorporateColors.red,
                              countdownRemainingColor: CorporateColors.cream,
                              countdownTotalColor: CorporateColors.green,
                              textStyle: TextStyle(
                                  color: CorporateColors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                              gapFactor: 18,
                              diameter: 240,
                              strokeWidth: 42.0,
                            ),
                            SizedBox(height: 24),
                            Text("GPS-Daten erhalten",
                                style: TextStyle(height: 1.6)),
                            Text("Zeitstempel gesetzt",
                                style: TextStyle(height: 1.6)),
                            Text("Temperatur gemessen",
                                style: TextStyle(height: 1.6)),
                            Text("Luftfeuchtigkeit gemessen",
                                style: TextStyle(height: 1.6)),
                          ]),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.wifi,
                                  color: CorporateColors.grey,
                                ),
                                SizedBox(width: 18),
                                Text("Gerät erfolgreich verbunden"),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: CorporateColors.cream,
                            ),
                            padding: const EdgeInsets.all(20.0),
                          ),
                        ],
                      ),
                      replacement: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Neue Messung",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => startMeasure(0),
                            onDoubleTap: () => startMeasure(62),
                            onLongPress: () => startMeasure(12),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Messung starten",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: CorporateColors.green,
                              ),
                              padding: const EdgeInsets.all(20.0),
                              height: 82,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.wifi,
                                  color: CorporateColors.grey,
                                ),
                                SizedBox(width: 16),
                                Text("Gerät erfolgreich verbunden"),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: CorporateColors.cream,
                            ),
                            padding: const EdgeInsets.all(20.0),
                          ),
                        ],
                      )),
                      visible: showCountdown.value,
                    ),
                  ),
                ),
              );
            }));
  }
}
