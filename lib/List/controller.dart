import 'package:flutter/material.dart';
import 'package:task_1/List/model.dart';
import 'package:task_1/List/repository.dart';

sealed class CoinsState {}

class CoinsLoadingState extends CoinsState {}

class CoinsDataState extends CoinsState {
  final List<Coin> coins;
  CoinsDataState(this.coins);
}

class CoinsErrorState extends CoinsState {
  final String message;
  CoinsErrorState(Object? message) : message = message.toString();
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

/// Todo
/// - детально просмотреть, как шаг за шагом работают все вызовы. Это можно узнать
/// с помощью логирования (log или print)
/// - немного освоить графический git в AS
/// - ✅ подумать над тем, как связать isLoading с виджетами (теперь у нас состояния)
/// - разобраться с _refresh, который не вызывает обновления на самом деле
/// - ✅ посмотреть на sealed классы и подумать над организацией состояний данные/загрузка/ошибка
