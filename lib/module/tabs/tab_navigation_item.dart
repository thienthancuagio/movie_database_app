import 'package:flutter/cupertino.dart';
import 'package:movie_database_app/module/popular/popular_page.dart';
import 'package:movie_database_app/module/search/search_page.dart';
import 'package:movie_database_app/module/top_rate/top_rate_screen.dart';
import 'package:movie_database_app/res/AppImage.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final String assets;

  TabNavigationItem(
      {@required this.page, @required this.title, @required this.assets});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
            page: PopularPage(),
            title: Text("Popular"),
            assets: AppImage.IC_POPULAR),
        TabNavigationItem(
            page: SearchScreen(),
            title: Text("Search"),
            assets: AppImage.IC_SEARCH),
        TabNavigationItem(
            page: TopRateScreen(),
            title: Text("Rate"),
            assets: AppImage.IC_RATE)
//      ,TabNavigationItem(
//          page: TopRateScreen(),
//          title: Text("Rate"),
//          assets: AppImage.IC_RATE)
        ];
}
