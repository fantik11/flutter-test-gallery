import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:src/models/item_model.dart';
import 'package:src/utils/constants.dart';

class PhotoApiProvider {
  static Future<ResultModel> fetchPhotos(
      {int page = 1, int itemsPerPage = 15}) async {
    http.Client client = http.Client();
    String _apiKey = Constants.CLIENT_API;

    String url = Constants.URL_TO_PHOTOS +
        "?client_id=$_apiKey&page=$page&per_page=$itemsPerPage";
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      return ResultModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Server return ' + response.statusCode.toString() + " code");
    }
  }
}
