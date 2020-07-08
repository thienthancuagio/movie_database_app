import 'dart:ffi';

import 'package:movie_database_app/util/model/Product.dart';

class MoveObject {
  int page;
  int total_results;
  int total_page;
  List<Product> resulst;

  MoveObject({
    this.page,
    this.total_results,
    this.total_page,
    this.resulst,
  });

  static MoveObject paserPopular(map) {
    return MoveObject.fromJson(map);
  }

  factory MoveObject.fromJson(Map<String, dynamic> json) => MoveObject(
      page: json["page"] ?? 0,
      total_results: json["total_results"] ?? 0,
      total_page: json["total_page"] ?? 0,
      resulst: Product.parserProductList(json));
}
