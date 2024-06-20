import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_1/List/model.dart';

class ApiServices {
  Future<CoinsModel?> getCoinsModel() async {
    try {
      var response =
          await http.get(Uri.parse('http://api.coincap.io/v2/assets'));

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        CoinsModel model = CoinsModel.fromJson(json.decode(response.body));
        log('res model: ${model.clients.toString()}');
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
