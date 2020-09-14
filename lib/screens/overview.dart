import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:borki/static.dart';
import 'listBox.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Übersicht")),
      child: SafeArea(
        child: Container(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 0,
            ),
            children: [
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 99,
                      timestamp: "15. September 2020",
                      location: "Lichtenbergstraße 6, Garching",
                      temperature: 27.9,
                      humidity: 71.2,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 38,
                      timestamp: "15. September 2020",
                      location: "Lichtenbergstraße 6, Garching",
                      temperature: 26.8,
                      humidity: 72.8,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "14. September 2020",
                      location: "Lichtenbergstraße 6, Garching",
                      temperature: 26.9,
                      humidity: 71.6,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "14. September 2020",
                      location: "Lichtenbergstraße 6, Garching",
                      temperature: 27.4,
                      humidity: 71.1,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 12,
                      timestamp: "14. September 2020",
                      location: "Lichtenbergstraße 6, Garching",
                      temperature: 24.5,
                      humidity: 71.4,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 57,
                      timestamp: "14. September 2020",
                      location: "Riedstraße 44, Türkenfeld",
                      temperature: 25.1,
                      humidity: 73.1,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "14. September 2020",
                      location: "Riedstraße 44, Türkenfeld",
                      temperature: 22.8,
                      humidity: 72.0,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "14. September 2020",
                      location: "Riedstraße 44, Türkenfeld",
                      temperature: 23.3,
                      humidity: 72.1,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 29,
                      timestamp: "13. September 2020",
                      location: "Burgholzer Weg, Türkenfeld",
                      temperature: 21.8,
                      humidity: 71.9,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 68,
                      timestamp: "13. September 2020",
                      location: "Burgholzer Weg, Türkenfeld",
                      temperature: 23.2,
                      humidity: 70.9,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 48,
                      timestamp: "13. September 2020",
                      location: "Burgholzer Weg, Türkenfeld",
                      temperature: 22.9,
                      humidity: 71.3,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 3,
                      timestamp: "13. September 2020",
                      location: "Burgholzer Weg, Türkenfeld",
                      temperature: 22.5,
                      humidity: 71.6,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "13. September 2020",
                      location: "Burgholzer Weg, Türkenfeld",
                      temperature: 22.1,
                      humidity: 72.3,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 19,
                      timestamp: "13. September 2020",
                      location: "Burgholzer Weg, Türkenfeld",
                      temperature: 21.5,
                      humidity: 72.9,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "13. September 2020",
                      location: "Burgholzer Weg, Türkenfeld",
                      temperature: 22.0,
                      humidity: 72.5,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "12. September 2020",
                      location: "Lichtenbergstraße 6",
                      temperature: 19.4,
                      humidity: 71.1,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 0,
                      timestamp: "12. September 2020",
                      location: "Lichtenbergstraße 6",
                      temperature: 18.9,
                      humidity: 71.8,
                      notes: "Lorem ipsum")),
              ListBox(
                  currentMeasureData: new MeasureData(
                      infestation: 78,
                      timestamp: "12. September 2020",
                      location: "Lichtenbergstraße 6",
                      temperature: 18.4,
                      humidity: 72.6,
                      notes: "Lorem ipsum")),
            ],
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
