import 'dart:convert';
import 'package:task_1/List/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<CoinsModel?> getCoinsModel() async {
    try {
      var response = await http.get(Uri.parse('http://api.coincap.io/v2/assets'));

      if (response.statusCode == 200){
        // print(json.decode(response.body));
        CoinsModel model = CoinsModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e){
      print(e.toString());
    }
    return null;
  }
}