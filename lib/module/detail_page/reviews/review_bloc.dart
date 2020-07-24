import 'package:flutter/cupertino.dart';
import 'package:movie_database_app/base/base_bloc.dart';
import 'package:movie_database_app/base/base_event.dart';
import 'package:movie_database_app/base/base_state.dart';
import 'package:movie_database_app/data/repo/MoveRepo.dart';
import 'package:movie_database_app/util/model/reviews_model.dart';

class ReviewsBloc extends BaseBloc {
  final int moveId;
  MoveRepo _repo;
  ReviewsBloc({MoveRepo repo, this.moveId }): this._repo = repo ?? MoveRepo();

  int pageNum = 1;

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetListReviews) {
      yield* _getReviews(this.moveId);
    } else if (event is LoadMoveReviews) {
      yield* _loadmoreReviews(this.moveId);
    }
  }

  Stream<BaseState> _getReviews(int id) async* {

    try {
       ReviewsModel object = await this._repo.getReviews(id, this.pageNum);
       this.pageNum ++;
      if (object != null) {
        yield LoadedState(data: object);
      } else {
        yield ErrorState(data: "Error");
      }

    } catch (e) {
      yield ErrorState(data: "error");
    }
  }

  Stream<BaseState> _loadmoreReviews(int id) async* {
    try {
      this.pageNum = 1;
      ReviewsModel object = await this._repo.getReviews(id, this.pageNum);
      this.pageNum ++;
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

class GetListReviews extends BaseEvent {}

class LoadMoveReviews extends BaseEvent {}
