import 'package:movie_database_app/util/model/base_model.dart';

class ReviewModel extends BaseModel{
  String id;
  String author;
  String content;
  String url;

  ReviewModel({this.id, this.author, this.content, this.url});


  static List<ReviewModel> paserListObject(map) {

    var list = map["result"] as List;

    return list.map((review) => ReviewModel.fromJson(review)).toList();
  }

//
  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        author: json["author"],
        content: json["content"],
    url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "content": content,
    "url": url
      };
}
