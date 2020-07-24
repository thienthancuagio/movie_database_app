import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/base/widget/align_text_left.dart';
import 'package:movie_database_app/base/widget/youtobe_thumbnail.dart';
import 'package:movie_database_app/module/detail_page/detail_bloc.dart';
import 'package:movie_database_app/module/detail_page/reviews/review_bloc.dart';
import 'package:movie_database_app/module/detail_page/trailer/trailes_bloc.dart';
import 'package:movie_database_app/util/model/Product.dart';
import 'package:movie_database_app/util/model/movie_model.dart';
import 'package:movie_database_app/util/model/reviews_model.dart';
import 'package:movie_database_app/util/model/trailer_model.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;
    return Container(child: _DetailPageBody());
  }
}

class _DetailPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;
    var top = 0.0;
    final double expandedHeight = 200.0;
    var opacity = 0.0;

    return BlocProvider<DetailBloc>(
      create: (context) => DetailBloc()..add(GetDetailMove(product.id)),
      child: Container(
        color: Colors.black12,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: expandedHeight,
                floating: false,
                pinned: true,

                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  if (top < 140) {
                    opacity = 1 - ((top - 100.0) / 40.0);
                  } else {
                    opacity = 0;
                  }
                  return FlexibleSpaceBar(
                      centerTitle: true,
                      title: Opacity(
                        opacity: opacity > 1 ? 1 : opacity,
                        child: Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Text(
                              product.title,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      background: Image.network(
                        "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                        fit: BoxFit.cover,
                      ));
                }), //
              ), //
            ];
          },
          body: Container(
              margin: EdgeInsets.only(top: 20),
              child: ConstrainedBox(
                child: _DetailContentBody(product.id),
                constraints: BoxConstraints.expand(),
              )),
        ),
      ),
    );
  }
}

class _DetailContentBody extends StatelessWidget {
  final double moveId;

  _DetailContentBody(this.moveId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<DetailBloc, BaseState>(
        builder: (BuildContext context, BaseState state) {
      if (state is LoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadedState<MovieModel>) {
        MovieModel movie = state.data;
        return Container(
          color: Colors.black12,
          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Container(
//              color: Colors.green,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  children: <Widget>[
                    Align(
                      child: Text(
                        movie.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Relesea Date:" + movie.release_date,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal),
                          ),
                        )),
                    AlignTextLeft(
                      text: movie.vote_average.toString() + "/10",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: AlignTextLeft(
                  text: "Summary",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeigh: FontWeight.bold,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  child: AlignTextLeft(
                    text: movie.overview,
                    fontSize: 14,
                    color: Colors.white,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: AlignTextLeft(
                    text: "Trailers",
                    color: Colors.white,
                    fontSize: 18,
                    fontWeigh: FontWeight.bold,
                  )),
              Container(
                height: 120,
                child: _DetailTrailerBody(this.moveId),
              ),
              Container(
                child: _DetailReviewBody(this.moveId.toInt()),
              )
            ],
          ),
        );
      } else {
        return Text("");
      }
    });
  }
}

class _DetailTrailerBody extends StatelessWidget {
  final double moveId;

  _DetailTrailerBody(this.moveId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<TrailesBloc>(
      create: (context) => TrailesBloc()..add(GetTrailer(this.moveId)),
      child: _DetailTrainer(this.moveId),
    );
  }
}

class _DetailTrainer extends StatelessWidget {
  final double moveId;

  _DetailTrainer(this.moveId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<TrailesBloc, BaseState>(
        builder: (BuildContext context, BaseState state) {
      if (state is LoadedState<TrailersModel>) {
        TrailersModel model = state.data;
        List<TrailerModel> listData = model.results;
        return Scaffold(
          body: Container(
            color: Colors.black12,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(listData.length, (index) {
                  return itemList(context, listData[index]);
                })),
          ),
          backgroundColor: Colors.black12,
        );
      } else {
        return Text("");
      }
    });
  }

  Widget itemList(BuildContext context, TrailerModel video) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2.0;
    return InkWell(
      child: Container(
        color: Colors.black12,
        margin: EdgeInsets.only(right: 20),
        child: SizedBox(
          width: itemWidth,
          child: YoutubeThumbnail(
            path: video.key,
          ),
        ),
      ),
//      ),
    );
  }
}

class _DetailReviewBody extends StatelessWidget {
  final int moveId;
  _DetailReviewBody(this.moveId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<ReviewsBloc>(
      create: (context) =>  ReviewsBloc(moveId: this.moveId)..add(GetListReviews()),
      child: _DetailReview(),
    );
  }
}

class _DetailReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<ReviewsBloc, BaseState>(
        builder: (BuildContext context, BaseState state) {
      if (state is LoadedState<ReviewsModel>) {
//        return Container();
      return Text("review ah");
      }
      return Text("");
    });
  }
}
