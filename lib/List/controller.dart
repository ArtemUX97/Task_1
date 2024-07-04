import 'package:flutter/material.dart';
import 'package:task_1/List/model.dart';
import 'package:task_1/List/repository.dart';

sealed class CoinsState {}

class CoinsLoadingState extends CoinsState {}

class CoinsDataState extends CoinsState {
  CoinsDataState(this.coins);

  final List<Coin> coins;
}

class CoinsErrorState extends CoinsState {
  CoinsErrorState(Object? message) : message = message.toString();

  final String message;
}

class CoinsNotifier extends ValueNotifier<CoinsState> {
  CoinsNotifier() : super(CoinsLoadingState());

  void init() async {
    try {
      final result = await _fetchCoins();
      value = CoinsDataState(result);
    } catch (e, s) {
      value = CoinsErrorState(e);
    }
  }

  Future<List<Coin>> _fetchCoins() async {
    return await ApiServices().getCoins();
  }
}

// todo(04.07.2024): Удалить после осмысления
class CoinsNotifierOLD extends ChangeNotifier {
  bool isLoading = false;

  List<Coin> _coins = [];
  List<Coin> get coins => _coins;

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
/// - подумать над тем, как связать isLoading с виджетами (✅теперь у нас состояния)
/// - разобраться с _refresh, который не вызывает обновления на самом деле
/// - ✅посмотреть на sealed классы и подумать над организацией состояний данные/загрузка/ошибка
