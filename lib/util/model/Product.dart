import 'dart:ffi';

class Product {
  String title;
  double vote_average;
  double id;
  String poster_path;
  String backdrop_path;
  double popularity;
  double vote_count;

//  Product();

  Product(
      {this.title,
      this.vote_average,
      this.id,
      this.poster_path,
      this.backdrop_path,
      this.popularity,
      this.vote_count});
  static List<Product> parserProductList(map) {
    var list = map["results"] as List;

    return list.map((product) => Product.fromJson(product)).toList();
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"] ?? '',
        vote_average: double.tryParse(json['vote_average'].toString()) ?? 0,
        id: double.tryParse(json['id'].toString()) ?? 0,
        poster_path: json["poster_path"] ?? '',
        backdrop_path: json["backdrop_path"] ?? '',
        popularity: double.tryParse(json['popularity'].toString()) ?? 0,
        vote_count: double.tryParse(json['vote_count'].toString()) ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "vote_average": vote_average,
        "id": id,
        "poster_path": poster_path,
        "backdrop_path": backdrop_path,
        "popularity": popularity,
        "vote_count": vote_count,
      };
}
