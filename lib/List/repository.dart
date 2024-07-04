import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_1/List/model.dart';

class ApiServices {
  Future<List<Coin>> getCoins() async {
    try {
      var response =
          await http.get(Uri.parse('http://api.coincap.io/v2/assets'));

      if (response.statusCode == 200) {
        final coins = [
          for (final clientJson in json.decode(response.body)?['data'] ?? [])
            Coin.fromJson(clientJson),
        ];
        // log('res model: ${model.clients.toString()}');
        return coins;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return [];
  }
}
