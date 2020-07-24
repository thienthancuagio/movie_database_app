import 'package:flutter/material.dart';
import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/data/repo/MoveRepo.dart';
import 'package:movie_database_app/util/model/trailer_model.dart';

class TrailesBloc extends BaseBloc {

  MoveRepo _repo;

  int id = 0;
  TrailesBloc({Key key, MoveRepo repo, @required int id})
      : this._repo = repo ?? MoveRepo(),
        this.id = id;
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetTrailer) {
      this.id = event.id.toInt();
      yield* _getTrailer(id);
    }
  }

  Stream<BaseState> _getTrailer(int id) async* {
    try {
      TrailersModel object = await this._repo.getTrailers(id);
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



class  GetTrailer extends BaseEvent {
  final double id;
  GetTrailer(this.id);
}