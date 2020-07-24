class Genres {
  int id;
  String name;
  Genres({this.id, this.name});

  static List<Genres> parserGenresList(map) {
    var list = map["genres"] as List;

    return list.map((product) => Genres.fromJson(product)).toList();
  }

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
      id: int.tryParse(json["id"].toString()) ?? 0, name: json["name"] ?? '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
