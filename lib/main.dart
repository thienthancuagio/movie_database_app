import 'package:flutter/material.dart';
import 'package:movie_database_app/module/popular/popular_page.dart';
import 'package:movie_database_app/module/tabs/tabs_page.dart';
import 'package:movie_database_app/module/top_rate/top_rate_screen.dart';
import 'package:movie_database_app/res/AppImage.dart';
import 'package:movie_database_app/util/Router.dart';

import 'module/search/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
//      home: TabsPage(),
      initialRoute: Routes.initScreen(),
      routes: Routes.routes,
//      initialRoute: Routes.initScreen(),
//      home: MyStatefulWidget(),
    );
  }
}

//class MyStatefulWidget extends StatefulWidget {
//  MyStatefulWidget({Key key}) : super(key: key);
//
//  @override
//  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
//}
//
//class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//  int _selectedIndex = 0;
//  static const TextStyle optionStyle =
//      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//  static const List<Widget> _widgetOptions = <Widget>[
//    TopRateScreen(),
//    TopRateScreen(),
//    TopRateScreen(),
//  ];
//
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text(''),
//      ),
//      body: Center(
//        child: _widgetOptions.elementAt(_selectedIndex),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: ImageIcon(
//              AssetImage(AppImage.IC_POPULAR),
//              size: 24,
//            ),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: ImageIcon(AssetImage(AppImage.IC_SEARCH)),
//            title: Text('Business'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.school),
//            title: Text('School'),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.amber[800],
//        onTap: _onItemTapped,
//      ),
//    );
//  }
//}
