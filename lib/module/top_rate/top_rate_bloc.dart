import 'package:movie_database_app/base/base.dart';
import 'package:movie_database_app/data/repo/MoveRepo.dart';
import 'package:movie_database_app/util/model/Popular.dart';

class TopRateBloc extends BaseBloc {

  int pageNum = 1;
  final MoveRepo _repo;

  TopRateBloc({MoveRepo moveRepo}) : this._repo = moveRepo ?? MoveRepo();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async*{
    // TODO: implement mapEventToState
    if (event is GetTopRate) {
      yield* _requestGetTopRate();
    } else if (event is LoadMoreTopRate) {
      yield* _loadMoreTopRate();
    } else if (event  is RefreshTopRate) {
      yield* _refreshTopRate();
    }

  }


  Stream<BaseState> _requestGetTopRate() async* {
    yield LoadingState();
    try {
      MoveObject popular = await _repo.getTopRate(this.pageNum); // null
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

  Stream<BaseState> _refreshTopRate() async* {
    try {
      this.pageNum = 1;
      MoveObject popular = await _repo.getTopRate(this.pageNum);
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

  Stream<BaseState> _loadMoreTopRate() async* {
    try {
      MoveObject popular = await _repo.getTopRate(this.pageNum);
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

class GetTopRate extends BaseEvent {}

class RefreshTopRate extends BaseEvent {}

class LoadMoreTopRate extends BaseEvent {}
