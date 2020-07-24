import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_database_app/base/base_state.dart';
import 'package:movie_database_app/base/widget/custom_image.dart';
import 'package:movie_database_app/module/top_rate/top_rate_bloc.dart';
import 'package:movie_database_app/util/Router.dart';
import 'package:movie_database_app/util/model/Popular.dart';
import 'package:movie_database_app/util/model/Product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopRateScreen extends StatelessWidget {
  const TopRateScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Scaffold(body: PopularWidget());
    return BlocProvider<TopRateBloc>(
      create: (context) => TopRateBloc()..add(GetTopRate()),
      child: PopularBody(),
    );
  }
}

class PopularBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PopularList(),
    );
  }
}

class PopularList extends StatelessWidget {
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    List<Product> listData = [];

    return BlocBuilder<TopRateBloc, BaseState>(
      builder: (BuildContext content, BaseState state) {
        var size = MediaQuery.of(context).size;
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
                BlocProvider.of<TopRateBloc>(content).add(RefreshTopRate());
              },
              onLoading: () {
                BlocProvider.of<TopRateBloc>(content).add(LoadMoreTopRate());
              },
              header: WaterDropMaterialHeader(),
              child: GridView.count(
                childAspectRatio: ratio,
                crossAxisCount: 2,
                padding: EdgeInsets.all(5),
                crossAxisSpacing: 5,
                children: List.generate(listData.length, (index) {
                  return itemList(content, listData[index]);
                }),
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
    var size = MediaQuery.of(content).size;

    return InkWell(
      onTap: () {
        print("tap ===");
        Navigator.of(content)
            .pushNamed(Routes.detailScreen, arguments: product);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: LoadImage(
                    path: product.poster_path,
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

