class BaseResult {
  int page;
  int total_results;
  int total_page;
  List<BaseModel> resulst;
//  String key_result = "result";

  BaseResult({this.page, this.total_page, this.total_results, this.resulst});

//  static BaseResult paserObject(map) {
//    String key = "result";
//    return BaseResult.fromJson(map, key);
//  }
//
//  static BaseResult paserObjectWithKey(map, key) {
//    key ?? "result";
//    return BaseResult.fromJson(map, key);
//  }

  factory BaseResult.fromJson(Map<String, dynamic> json, key) => BaseResult(
      page: json["page"] ?? 0,
      total_results: json["total_results"] ?? 0,
      total_page: json["total_page"] ?? 0,
      resulst: BaseModel.paserListObject(json, key));
}

//abstract BaseModel {
//
//}

class BaseModel {

  BaseModel();

  final String key_result = "reuslt";

   static List<BaseModel> paserListObject(map, key) {
    var list = map[key] as List;
    return list.map((e) => BaseModel.fromJson(e)).toList();
  }

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel();
}
