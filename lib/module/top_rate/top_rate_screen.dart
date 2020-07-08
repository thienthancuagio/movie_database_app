import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';

class TopRateScreen extends StatelessWidget {
  const TopRateScreen();

  @override
  Widget build(BuildContext context) {
    final SearchBarController<Post> _searchBarController =
        SearchBarController();
    return Scaffold(
      body: SafeArea(
        child: SearchBar<Post>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
//          headerPadding: EdgeInsets.symmetric(horizontal: 10),
//          listPadding: EdgeInsets.symmetric(horizontal: 10),

          searchBarController: _searchBarController,
//          placeHolder: Text("placeholder"),
          cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
//          indexedScaledTileBuilder: (int index) =>
//              ScaledTile.count(1, index.isEven ? 2 : 1),

          onCancelled: () {
            print("Cancelled triggered");
          },
//          mainAxisSpacing: 10,
//          crossAxisSpacing: 10,
//          crossAxisCount: 2,
//          onItemFound: (Post post, int index) {
//            return Container(
//              color: Colors.lightBlue,
//              child: ListTile(
//                title: Text(post.title),
//                isThreeLine: true,
//                subtitle: Text(post.body),
//                onTap: () {
////                  Navigator.of(context)
////                      .push(MaterialPageRoute(builder: (context) => Detail()));
//                },
//              ),
//            );
//          },
        ),
      ),
    );
  }
}

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

//class _TopRateScreenState extends State<TopRateScreen> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(body: Container(child: Text("Đay là màn hình top qrate")));
//  }
//}
