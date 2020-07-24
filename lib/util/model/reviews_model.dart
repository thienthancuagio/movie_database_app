import 'package:movie_database_app/util/model/review_model.dart';

class ReviewsModel{
  int page;
  int total_results;
  int total_page;
  List<ReviewModel> resulst;
  ReviewsModel({this.page, this.total_page, this.total_results, this.resulst});

  static ReviewsModel paserObject(map) {
    String key = "result";
    return ReviewsModel.fromJson(map);
  }


  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
      page: json["page"] ?? 0,
      total_results: json["total_results"] ?? 0,
      total_page: json["total_page"] ?? 0,
      resulst: ReviewModel.paserListObject(json));

}