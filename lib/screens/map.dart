import 'package:WoodPinger/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<double>> coords = [
      [48.268, 11.695],
      [48.271, 11.623],
      [48.240, 11.666],
      [48.266, 11.689],
    ];
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Karte")),
      child: SafeArea(
        child: Container(
          child: Center(
            child: new FlutterMap(
              options: new MapOptions(
                center: new LatLng(48.267, 11.663),
                zoom: 12.0,
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
                    for (var i in coords)
                      new Marker(
                        width: 25,
                        height: 25.0,
                        point: new LatLng(i[0], i[1]),
                        builder: (ctx) => new Container(
                          decoration: BoxDecoration(
                              color: CorporateColors.red,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(offset: Offset(1, 1))]),
                          child: Container(
                            child: Icon(
                              FontAwesomeIcons.exclamationCircle,
                              size: 15.0,
                              color: CorporateColors.cream,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
