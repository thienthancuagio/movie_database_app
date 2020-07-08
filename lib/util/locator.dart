import 'package:get_it/get_it.dart';
import 'package:movie_database_app/data/network/network.dart';
import 'package:movie_database_app/data/repo/MoveRepo.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
//  locator.registerLazySingleton(() => NetworkClient());
//  locator.registerLazySingleton(() => RequestService());
  locator.registerLazySingleton(() => MoveRepo());
//  locator.registerLazySingleton(() => RequestService());
}
