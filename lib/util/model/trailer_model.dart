class TrailersModel {
  int id;
  List<TrailerModel> results;

  TrailersModel({this.id, this.results});

  static TrailersModel paserObject(map) {
    return TrailersModel.fromJson(map);
  }

  factory TrailersModel.fromJson(Map<String, dynamic> json) => TrailersModel(
      id: int.tryParse(json["id"].toString()) ?? 0,
      results: TrailerModel.paserList(json));

  Map<String, dynamic> toJson() => {"id": id, "results": results};
}


class TrailerModel {
  String id;

//  String so_639_1;
  String key;
  String name;
  String site;
  int size;
  String type;

  TrailerModel({this.id, this.key, this.name, this.site, this.size, this.type});

  static List<TrailerModel> paserList(map) {
    var list = map["results"] as List;

    return list.map((product) => TrailerModel.fromJson(product)).toList();
  }

  factory TrailerModel.fromJson(Map<String, dynamic> json) => TrailerModel(
      id: json["id"] ?? '',
      name: json["name"] ?? '',
      key: json["key"],
      site: json["site"],
      size: int.parse(json["size"].toString()) ?? 0,
      type: json["type"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type
      };
}
