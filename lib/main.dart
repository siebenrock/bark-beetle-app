import 'package:WoodPinger/screens/screens.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Woodpinger',
      home: Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatelessWidget {
  const Main({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return Measure();
            });
            break;
          case 1:
            return CupertinoTabView(builder: (context) {
              return Overview();
            });
            break;
          case 2:
            return CupertinoTabView(builder: (context) {
              return Map();
            });
            break;
          default:
        }
      },
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_circled),
            title: Text("Messung"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            title: Text("Übersicht"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location),
            title: Text("Karte"),
          ),
        ],
      ),
    );
  }
}
