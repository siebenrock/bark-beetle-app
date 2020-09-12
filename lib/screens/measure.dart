import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Measure extends StatelessWidget {
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
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Status: " + documentFields["status"].toString()),
                    Text("Infestation: " +
                        documentFields["infestation"].toString()),
                    Text(documentFields["duration"].toString() + " Sekunden"),
                    Text("Notizen: " + documentFields["notes"].toString()),
                  ]);
            }));
  }
}
