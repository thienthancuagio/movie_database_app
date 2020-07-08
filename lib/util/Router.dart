import 'package:flutter/cupertino.dart';
import 'package:movie_database_app/module/detail_page/detail_page.dart';
import 'package:movie_database_app/module/popular/popular_page.dart';
import 'package:movie_database_app/module/search/search_page.dart';
import 'package:movie_database_app/module/tabs/tabs_page.dart';

class Routes {
  Routes._();
  static const String hommScreen = "/";
  static const String tabBaScreen = "/";
  static const String popularScreen = "/popularScreen";
  static const String searchScreen = "/searchScreen";
  static const String detailScreen = "/detailScreen";

  static String initScreen() => tabBaScreen;
  static final routes = <String, WidgetBuilder>{
    tabBaScreen: (context) => TabsPage(),
//    popularScreen: (context) => PopularPage(),
//    searchScreen: (context) => SearchScreen(),
    detailScreen: (context) => DetailPage(),
  };
}
