class ResultModel {
  List<PhotoModel> items = [];
  ResultModel.fromJson(List<dynamic> json) {
    for (var i = 0; i < json.length; i++) {
      items.add(PhotoModel.fromJson(json[i]));
    }
  }
}

class PhotoModel {
  String id;
  String user;
  String title;
  String thumbImageUrl;
  String regularImageUrl;
  PhotoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    user = json["user"]["name"];
    title = json["description"] != null
        ? trimTitle(json["description"])
        : "Unnamed photo";
    thumbImageUrl = json["urls"]["thumb"];
    regularImageUrl = json["urls"]["regular"];
  }

  static String trimTitle(String str) {
    return str.replaceAll("\r", "").replaceAll("\n", "").replaceAll("\t", "");
  }
}
