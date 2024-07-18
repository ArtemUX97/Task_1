import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_1/secondPage/model.dart';

class ApiServicesSecond {
  Future<List<Options>> getOptions() async {
    try {
      var response = await http.get(
        Uri.parse(
            'http://api.coincap.io/v2/candles?exchange=bitstamp&interval=w1&baseId=bitcoin&quoteId=united-states-dollar'),
      );

      if (response.statusCode == 200) {
        log(response.body);
        final option = [
          for (final clientJson in json.decode(response.body)?['data'] ?? [])
            Options.fromJson(clientJson),
        ];
        return option;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return [];
  }
}
