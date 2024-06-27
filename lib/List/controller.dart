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

    _coins = await _fetchCoins();

    isLoading = false;
    notifyListeners();
  }

  Future<List<Coin>> _fetchCoins() async {
    final response = await ApiServices().getCoins();

    return response;
  }
}

/// Todo
/// - детально просмотреть, как шаг за шагом работают все вызовы. Это можно узнать
/// с помощью логирования (log или print)
/// - немного освоить графический git в AS
/// - подумать над тем, как связать isLoading с виджетами
/// - разобраться с _refresh, который не вызывает обновления на самом деле
/// - посмотреть на sealed классы и подумать над организацией состояний данные/загрузка/ошибка
