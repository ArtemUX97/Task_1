import 'package:flutter/material.dart';
import 'package:task_1/List/model.dart';
import 'package:task_1/List/repository.dart';


class CoinsNotifier extends ChangeNotifier{
  bool isLoading = false;

  List<Client> _coins = [];
  List<Client> get clients => _coins;

  Future<Client?> getClientCoin() async {
    isLoading = true;
    notifyListeners();

    final response = await ApiServices().getClient();

    _coins = response as List<Client>;
    isLoading = false;
    notifyListeners();
  }
}