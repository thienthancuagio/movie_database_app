import 'package:flutter/material.dart';
import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/data/repo/MoveRepo.dart';
import 'package:movie_database_app/util/model/movie_model.dart';
import 'package:movie_database_app/util/model/reviews_model.dart';
import 'package:movie_database_app/util/model/trailer_model.dart';

class DetailBloc extends BaseBloc {
  MoveRepo _repo;

  int id = 0;
  DetailBloc({Key key, MoveRepo repo, @required int id})
      : this._repo = repo ?? MoveRepo(),
        this.id = id;
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
//    throw UnimplementedError();
    if (event is GetDetailMove) {
      this.id = event.id.toInt();
      yield* _getDetail(this.id);
    }
  }

  Stream<BaseState> _getDetail(int id) async* {
    try {
      MovieModel object = await this._repo.geMovieDetail(id);
      if (object != null) {
        yield LoadedState(data: object);
      } else {
        yield ErrorState(data: "Error");
      }
    } catch (e) {
      yield ErrorState(data: "error");
    }
  }
}

class GetDetailMove extends BaseEvent {
  final double id;
  GetDetailMove(this.id);

}