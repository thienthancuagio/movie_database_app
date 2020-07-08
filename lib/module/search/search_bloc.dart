import 'package:flutter/cupertino.dart';
import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/data/repo/MoveRepo.dart';
import 'package:movie_database_app/util/model/Popular.dart';

class SearchBloc extends BaseBloc {
  MoveRepo _repo;
  int pageNum = 1;
  String keyword = "";
  SearchBloc({Key key, MoveRepo repo, @required String keyword})
      : this._repo = repo ?? MoveRepo(),
        this.keyword = keyword;
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SearchMove) {
      this.keyword = event.keyword;
      yield* _searchMove(keyword);
    } else if (event is LoadMoreMove) {
      yield* _loadMoreSearchMove(this.keyword);
    } else if (event is RefreshSearchMove) {
      yield* _refreshSearchMove(keyword);
    }
  }

  Stream<BaseState> _searchMove(String keyword) async* {
    try {
      this.pageNum = 1;
      print("keyword ==" + keyword);
      MoveObject object = await this._repo.getSearchMove(keyword, pageNum);
      this.pageNum++;
      if (object != null) {
        yield LoadedState<MoveObject>(data: object);
      } else {
        yield ErrorState<String>(data: "Lỗi dữ liệu");
      }
    } catch (e) {
      yield ErrorState<String>(data: "Lỗi dữ liệu");
    }
  }

  Stream<BaseState> _refreshSearchMove(String keyword) async* {
    this.pageNum = 1;
    try {
      MoveObject object = await this._repo.getSearchMove(keyword, pageNum);
      this.pageNum++;
      if (object != null) {
        yield LoadedState<MoveObject>(data: object);
      } else {
        yield ErrorState<String>(data: "Lỗi dữ liệu");
      }
    } catch (e) {
      yield ErrorState<String>(data: "Lỗi dữ liệu");
    }
  }

  Stream<BaseState> _loadMoreSearchMove(String keyword) async* {
    try {
      MoveObject object = await this._repo.getSearchMove(keyword, pageNum);
      this.pageNum++;
      if (object != null) {
        yield LoadedState<MoveObject>(data: object);
      } else {
        yield ErrorState<String>(data: "Lỗi dữ liệu");
      }
    } catch (e) {
      yield ErrorState<String>(data: "Lỗi dữ liệu");
    }
  }

  Stream<BaseState> setKeyword(String keyword) {
    this.keyword = keyword;
  }
}

class SearchMove extends BaseEvent {
  final String keyword;
  SearchMove(this.keyword);
}

class LoadMoreMove extends BaseEvent {}

class RefreshSearchMove extends BaseEvent {}
