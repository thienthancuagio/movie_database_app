import 'package:dio/dio.dart';
import 'package:movie_database_app/data/network/api_constant.dart';
import 'package:movie_database_app/data/network/network.dart';
import 'package:movie_database_app/util/Constant.dart';

class RequestService {
  RequestService();

  Future<Response> getListTopPopular(int page) {
    return NetworkClient.instance.dio.get(
      ApiConstant.TOP_POPULAR,
      queryParameters: {'page': page, 'api_key': Constant.API_KEY},
    );
  }

  Future<Response> getSearchKeywork(String keyword, int page) {
    return NetworkClient.instance.dio.get(ApiConstant.SEARCH_API,
        queryParameters: {
          'page': page,
          'api_key': Constant.API_KEY,
          'query': keyword
        });
  }
}
