import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:WoodPinger/static.dart';

class Result extends StatelessWidget {
  final MeasureData currentMeasureData;
  final String previousTitle;

  Result(
      {Key key,
      @required this.currentMeasureData,
      @required String this.previousTitle})
      : super(key: key);

  share(BuildContext context, String text, String subject) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    final int infestation = currentMeasureData.infestation;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: previousTitle,
        middle: Text("Messergebnis"),
        trailing: GestureDetector(
          child: Icon(CupertinoIcons.share),
          onTap: () {
            share(context, "Messergebnis", "Befall: $infestation");
          },
        ),
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
                    padding: EdgeInsets.symmetric(
                      vertical: 60.0,
                      horizontal: 22.0,
                    ),
                    child: Column(children: [
                      Icon(
                        infestation > 40
                            ? FontAwesomeIcons.exclamationCircle
                            : (infestation == 0
                                ? FontAwesomeIcons.solidCheckCircle
                                : FontAwesomeIcons.binoculars),
                        color: Colors.white,
                        size: 62,
                      ),
                      SizedBox(height: 28),
                      Text(
                          infestation > 40
                              ? "Starker Befall"
                              : (infestation == 0
                                  ? "Kein Befall"
                                  : "Leichter Befall"),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.temperatureLow,
                      color: CorporateColors.red,
                    ),
                    SizedBox(width: 14),
                    Text("Temperatur:"),
                    Spacer(),
                    Text("${currentMeasureData.temperature}°"),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CorporateColors.cream,
                ),
                padding: const EdgeInsets.all(20.0),
              ),
              SizedBox(height: 16),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.tint,
                      color: CorporateColors.red,
                    ),
                    SizedBox(width: 14),
                    Text("Luftfeuchtigkeit:"),
                    Spacer(),
                    Text("${currentMeasureData.humidity}%"),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CorporateColors.cream,
                ),
                padding: const EdgeInsets.all(20.0),
              ),
              SizedBox(height: 16),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidCompass,
                      color: CorporateColors.red,
                    ),
                    SizedBox(width: 14),
                    Text("${currentMeasureData.location}"),
                    SizedBox(),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CorporateColors.cream,
                ),
                padding: const EdgeInsets.all(20.0),
              ),
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 182,
                  child: Center(
                    child: new FlutterMap(
                      options: new MapOptions(
                        center: new LatLng(48.267, 11.663),
                        zoom: 13.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c']),
                        new MarkerLayerOptions(
                          markers: [
                            new Marker(
                              width: 40,
                              height: 40,
                              point: new LatLng(48.267, 11.663),
                              builder: (ctx) => new Container(
                                child: Container(
                                  child: Icon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    size: 40,
                                    color: CorporateColors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
