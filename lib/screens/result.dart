import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:WoodPinger/static.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Messergebnis"),
      ),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 450,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(121, 158, 106, 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(children: [
                      Text("Messergebnis",
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.thermometerHalf,
                      color: CorporateColors.red,
                    ),
                    SizedBox(width: 12),
                    Text("Temperatur:"),
                    Spacer(),
                    Text("27°"),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CorporateColors.cream,
                ),
                padding: const EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.thermometerHalf,
                      color: CorporateColors.red,
                    ),
                    SizedBox(width: 12),
                    Text("Temperatur:"),
                    Spacer(),
                    Text("27°"),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CorporateColors.cream,
                ),
                padding: const EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.thermometerHalf,
                      color: CorporateColors.red,
                    ),
                    SizedBox(width: 12),
                    Text("Temperatur:"),
                    Spacer(),
                    Text("27°"),
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
        ),
      ]),
    );
  }
}
