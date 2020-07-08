import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/data/repo/MoveRepo.dart';
import 'package:movie_database_app/util/locator.dart';
import 'package:movie_database_app/util/model/Popular.dart';
import 'package:movie_database_app/util/model/Product.dart';

class PopularBloc extends BaseBloc {
  int pageNum = 1;
  final MoveRepo _repo;

  PopularBloc({MoveRepo moveRepo}) : this._repo = moveRepo ?? MoveRepo();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetPopular) {
      yield* _requestGetPopular();
    } else if (event is RefreshPopular) {
      yield* _refreshGetPopular();
    } else if (event is LoadMorePopular) {
      yield* _loadMorePopular();
    }
  }

  Stream<BaseState> _requestGetPopular() async* {
    yield LoadingState();
    try {
      MoveObject popular = await _repo.getPopular(this.pageNum); // null
      if (popular != null) {
        pageNum++;
        yield LoadedState<MoveObject>(data: popular);
      } else {
        yield ErrorState<String>(data: "Lỗi dữ liệu");
      }
    } catch (e) {
      print(e);
      print("log error " + e.toString());
      yield ErrorState<String>(data: e.toString());
    }
  }

  Stream<BaseState> _refreshGetPopular() async* {
    try {
      this.pageNum = 1;
      MoveObject popular = await _repo.getPopular(this.pageNum);
      if (popular != null) {
        pageNum++;
        yield LoadedState<MoveObject>(data: popular);
      } else {
        yield ErrorState<String>(data: "Lỗi dữ liệu");
      }
    } catch (e) {
      yield ErrorState<String>(data: e.toString());
    }
  }

  Stream<BaseState> _loadMorePopular() async* {
    try {
      MoveObject popular = await _repo.getPopular(this.pageNum);
      if (popular != null) {
        pageNum++;
        yield LoadedState<MoveObject>(data: popular);
      } else {
        yield ErrorState<String>(data: "Lỗi dữ liệu");
      }
    } catch (e) {
      yield ErrorState<String>(data: e.toString());
    }
  }
}

class GetPopular extends BaseEvent {}

class RefreshPopular extends BaseEvent {}

class LoadMorePopular extends BaseEvent {}
