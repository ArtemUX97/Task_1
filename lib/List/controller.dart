import 'package:flutter/material.dart';
import 'model.dart';

class CoinsNotifier extends ChangeNotifier{

  final List<Clients> _coins = [];
  List<Clients> get coins => _coins;

  void listenState() {
    _coins;
    notifyListeners();
  }
}