import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_database_app/data/request/request_service.dart';
import 'package:movie_database_app/util/locator.dart';
import 'package:movie_database_app/util/model/Popular.dart';
import 'package:movie_database_app/util/model/RestError.dart';
import 'package:movie_database_app/util/model/movie_model.dart';
import 'package:movie_database_app/util/model/review_model.dart';
import 'package:movie_database_app/util/model/reviews_model.dart';
import 'package:movie_database_app/util/model/trailer_model.dart';

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

  Future<MovieModel> geMovieDetail(int id) async {
    try {
      var response = await _requestService.getMoveDetail(id);
      var movie = MovieModel.paserMovie(response.data);
      return movie;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<TrailersModel> getTrailers(int id) async {
    try {
      var response = await _requestService.getTrainers(id);
      TrailersModel model = TrailersModel.paserObject(response.data);
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ReviewsModel> getReviews(int id, int page) async {
    try {
      var response = await _requestService.getReviews(id, page);
      ReviewsModel movie = ReviewsModel.paserObject(response.data);
      return movie;
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<MoveObject> getTopRate(int page) async {
    try {
      var response = await _requestService.getListTopRate(page);
      var productList = MoveObject.paserPopular(response.data);
      return productList;
    } on DioError {
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
