import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_database_app/data/request/request_service.dart';
import 'package:movie_database_app/util/locator.dart';
import 'package:movie_database_app/util/model/Popular.dart';
import 'package:movie_database_app/util/model/RestError.dart';

class MoveRepo {
  RequestService _requestService = RequestService();
  MoveRepo();

  Future<MoveObject> getPopular(int page) async {
    try {
      var response = await _requestService.getListTopPopular(page);
      var productList = MoveObject.paserPopular(response.data);
      return productList;
    } on DioError {
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<MoveObject> getSearchMove(String keyword, int page) async {
    try {
      var response = await _requestService.getSearchKeywork(keyword, page);
      var productList = MoveObject.paserPopular(response.data);
      return productList;
    } on DioError {
      return null;
    } catch (e) {
      return null;
    }
  }
}
