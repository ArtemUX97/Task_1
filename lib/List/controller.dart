import 'package:flutter/material.dart';
import 'package:task_1/List/model.dart';
import 'package:task_1/List/repository.dart';

class CoinsNotifier extends ChangeNotifier {
  bool isLoading = false;

  List<Coin> _coins = [];
  List<Coin> get clients => _coins;

  void init() async {
    isLoading = true;
    notifyListeners();

    _coins = await getClientCoin();

    isLoading = false;
    notifyListeners();
  }

  Future<List<Coin>> getClientCoin() async {
    final response = await ApiServices().getCoins();

    return response;
  }
}
