import 'package:flutter/material.dart';

class CorporateColors {
  static const Color cream = const Color.fromRGBO(232, 224, 228, 1);
  static const Color light = const Color.fromRGBO(127, 116, 127, 1);
  static const Color grey = const Color.fromRGBO(122, 109, 121, 1);
  static const Color red = const Color.fromRGBO(198, 38, 38, 1);
  static const Color green = const Color.fromRGBO(121, 158, 106, 1);
  static const Color orange = const Color.fromRGBO(242, 157, 46, 1);
}

class MeasureData {
  int infestation;
  String timestamp;
  String location;
  double temperature;
  double humidity;
  String notes;

  int get getData {
    return this.infestation;
  }

  void setData(int infestation) {
    this.infestation = infestation;
  }

  MeasureData({
    this.infestation,
    this.timestamp,
    this.location,
    this.temperature,
    this.humidity,
    this.notes,
  });
}
