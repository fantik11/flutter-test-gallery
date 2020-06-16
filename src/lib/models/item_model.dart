class ResultModel
{
  List<ItemModel> items = [];
  ResultModel.fromJson(List<dynamic> json)
  {
    for (var i = 0; i < json.length; i++) {
      items.add(ItemModel.fromJson(json[i]));
    }
  }
}

class ItemModel
{
  String id;
  String user;
  String title;
  String thumbImageUrl;
  String fullImageUrl;
  ItemModel.fromJson(Map<String, dynamic> json)
  {
    id = json["id"];
    user = json["user"]["name"];
    title = json["description"] != null ? trimTitle(json["description"]) : "Unnamed photo";
    thumbImageUrl = json["urls"]["thumb"];
    fullImageUrl = json["urls"]["full"];
  }

  static String trimTitle(String str)
  {
    return str.replaceAll("\r", "").replaceAll("\n", "").replaceAll("\t", "");
  }
}