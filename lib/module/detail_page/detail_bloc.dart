import 'package:movie_database_app/base/base.dart';

class DetailBloc extends BaseBloc {
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
//    throw UnimplementedError();
    if (event is GetDetailMove) {
    } else {}
  }
}

class GetDetailMove extends BaseEvent {}
