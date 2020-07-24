class ProductionCompany {
  int id;
  String name;
  String origin_country;

  ProductionCompany({this.id, this.name, this.origin_country});

  static List<ProductionCompany> paserProductionCompany(map) {
    var list = map["production_companies"] as List;

    return list.map((product) => ProductionCompany.fromJson(product)).toList();
  }

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
          id: int.tryParse(json["id"].toString()) ?? 0,
          name: json["name"] ?? '',
          origin_country: json["origin_country"] ?? '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "origin_country": origin_country,
      };
}
