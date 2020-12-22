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

class Main extends StatefulWidget {
  const Main({
    Key key,
  }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentIndex = 0;

  final GlobalKey<NavigatorState> measureNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: measureNavKey,
              builder: (BuildContext context) => Measure(),
            );
            break;
          case 1:
            return CupertinoTabView(
              navigatorKey: secondTabNavKey,
              builder: (BuildContext context) => Overview(),
            );
            break;
          case 2:
            return CupertinoTabView(
              navigatorKey: thirdTabNavKey,
              builder: (BuildContext context) => Map(),
            );
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
        onTap: (index) {
          // back home only if not switching tab
          if (currentIndex == index) {
            switch (index) {
              case 0:
                measureNavKey.currentState.popUntil((r) => r.isFirst);
                break;
              case 1:
                secondTabNavKey.currentState.popUntil((r) => r.isFirst);
                break;
              case 2:
                thirdTabNavKey.currentState.popUntil((r) => r.isFirst);
                break;
            }
          }
          currentIndex = index;
        },
      ),
    );
  }
}
