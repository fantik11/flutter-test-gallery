class ResultModel
{
  List<ItemModel> items = [];
  ResultModel.fromJson(Map<String, dynamic> json)
  {
    for (var i = 0; i < json.length; i++) {
      items.add(json[i]);
    }
  }
}

class ItemModel
{
  String id;
  String user;
  String thumbImageUrl;
  String fullImageUrl;
  ItemModel.fromJson(Map<String, dynamic> json)
  {
    id = json["id"];
    user = json["user"]["name"];
    thumbImageUrl = json["urls"]["thumb"];
    fullImageUrl = json["urls"]["full"];
  }
}