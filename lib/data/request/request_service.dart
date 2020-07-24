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

  Future<Response> getMoveDetail(int id) {
    return NetworkClient.instance.dio.get(
        ApiConstant.DETAIL_API + "/" + id.toString() +"",
        queryParameters: {'api_key': Constant.API_KEY});
  }

  Future<Response> getTrainers(int id) {
    print("get trailer");
    return NetworkClient.instance.dio.get(
        ApiConstant.GET_LIST_TRAINER + "/" + id.toString() +"/videos",
        queryParameters: {'api_key': Constant.API_KEY});
  }

  Future<Response> getReviews(int id, int  page) {
    print("get review =" + id.toString());
    return NetworkClient.instance.dio.get(
        ApiConstant.DETAIL_REVIEWS + "/" + id.toString() +"/reviews",
        queryParameters: {'api_key': Constant.API_KEY, "page": page},);
  }

  Future<Response> getListTopRate(int page) {
    return NetworkClient.instance.dio.get(
      ApiConstant.TOP_RATE,
      queryParameters: {'page': page, 'api_key': Constant.API_KEY},
    );
  }
}
