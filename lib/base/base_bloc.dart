import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_database_app/base/base.dart';

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {
  @override
  BaseState get initialState => InitState();
}
