//import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/base/widget/custom_image.dart';
import 'package:movie_database_app/module/search/search_bloc.dart';
import 'package:movie_database_app/res/AppImage.dart';
import 'package:movie_database_app/util/model/Popular.dart';
import 'package:movie_database_app/util/model/Product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchScreen extends StatelessWidget {
//  const SearchPage()
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SearchScreen(),
      );

  @override
  Widget build(BuildContext context) {
//    return SearchPage();
//    return SearchBar();
//    return SearchBarBody();
//  }
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(),
      child: SearchMoveBody(),
    );
  }
}

class SearchMoveBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        SearchBarBody(),
        Expanded(
            flex: 1,
            child: Container(
//              height: 100,
              margin: EdgeInsets.only(top: 10),
              child: ListSearchMove(),
            ))
      ],
    );
  }
}

class SearchBarBody extends StatelessWidget {
  final focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 44,
//      color: Colors.green,
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(
              width: 1 / MediaQuery.of(context).devicePixelRatio,
              color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 5),
            child: InkWell(
              onTap: () {
                this.focusNode.requestFocus();
              },
              child: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Container(
//              color: Colors.red,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                focusNode: focusNode,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  print(value);
                  BlocProvider.of<SearchBloc>(context).add(SearchMove(value));
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}

class ListSearchMove extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    List<Product> listData = [];

    return BlocBuilder<SearchBloc, BaseState>(
      builder: (BuildContext content, BaseState state) {
        var size = MediaQuery.of(context).size;
        final width = (size.width / 2) - 20;
        final rate = size.height / size.width;
        const rateDefault = 9 / 16;
        final ratio = (rate > rateDefault) ? rateDefault : rate;
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState<MoveObject>) {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
          listData.addAll(state.data.resulst);
          return SmartRefresher(
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () {
                listData = [];
                BlocProvider.of<SearchBloc>(content).add(RefreshSearchMove());
              },
              onLoading: () {
                BlocProvider.of<SearchBloc>(content).add(LoadMoreMove());
              },
              header: WaterDropMaterialHeader(),
//            child: Text("ha ha"),
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                childAspectRatio: ratio,
                crossAxisCount: 2,
                padding: EdgeInsets.all(5),
                crossAxisSpacing: 5,
                children: List.generate(
                  listData.length,
                  (index) {
                    return itemList(content, listData[index]);
                  },
                ),
              ));
        } else {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
          return Center(
            child: Text("Không có dữ liệu!"),
          );
        }
      },
    );
  }

  Widget itemList(BuildContext content, Product product) {
    String postPath = "";
    if (product != null && product.poster_path != null) {
      postPath = product.poster_path;
    } else {}
    return InkWell(
      onTap: () {
        print("tap ===");
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: LoadImage(
                    path: postPath,
                  ),
                )),
            Container(
              height: 40,
              padding: EdgeInsets.only(bottom: 0, top: 0, left: 5, right: 5),
              margin: EdgeInsets.only(bottom: 0, top: 5),
              child: Column(
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "vote avg: " + product.vote_average.toString(),
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
