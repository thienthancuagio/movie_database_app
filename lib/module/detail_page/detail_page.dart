import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/base/widget/custom_image.dart';
import 'package:movie_database_app/module/detail_page/detail_bloc.dart';
import 'package:movie_database_app/res/AppImage.dart';
import 'package:movie_database_app/util/model/Product.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;
    print("log title  product =" + product.title);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            title:,
            expandedHeight: 200.0,
            floating: true,
            pinned: false,
//            snap: true,
            actionsIconTheme: IconThemeData(opacity: 0.0),
//            flexibleSpace: ,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/hotgirt.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      stops: [0.5, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.repeated,
                    ),
                  ),
                ),
//                Positioned(
//                  left: 16.0,
//                  right: 16.0,
//                  bottom: 16.0,
//                  child: Text(
//                    'Lorem ipsum',
//                    style: TextStyle(
//                        fontSize: 32.0, color: Colors.white.withOpacity(0.5)),
//                  ),
//                ),
//                ),
              ],
            ),
          ),
          Container(
            child: _BodyDetail(),
          )
        ],
      ),
    );
//    return BlocProvider(
//      child: DetailPage(),
//    );
  }
}

class DetailPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _BodyDetail();
  }
}

class _BodyDetail extends StatelessWidget {
  final int idMove = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

//    var size = MediaQuery.of(context).size;
    return BlocBuilder<DetailBloc, BaseState>(
      builder: (BuildContext content, BaseState state) {
        if (state is GetDetailMove) {
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: LoadImage(
                    path: "",
                  ),
                ),
                Text('Day la detai')
              ],
            ),
          );
        } else {
          return Text("");
        }
      },
    );
  }
}
