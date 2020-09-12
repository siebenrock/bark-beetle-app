import 'package:borki/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class UserModel {
  String name = "Jeff";
}

var stream = Stream.fromIterable([UserModel()]);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      stream: stream,
      child: CupertinoApp(
        title: 'Borki',
        home: Main(),
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          child: CupertinoTabScaffold(
              tabBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Measure();
                    break;
                  case 1:
                    return Overview();
                    break;
                  case 2:
                    return Map();
                    break;
                  default:
                }
              },
              tabBar: CupertinoTabBar(items: [
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
              ])),
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text("Woodpinger"),
        trailing: Icon(CupertinoIcons.info),
      ),
    );
  }
}
