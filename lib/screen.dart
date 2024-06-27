import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'List/controller.dart';
import 'List/itemList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future _refresh() {
    // todo(27.06.2024): этот метод ничего не делает
    // а он должен вызвать метод обновления состояния в нотифаере
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final coinsNotifier = Provider.of<CoinsNotifier>(context);
    final coins = coinsNotifier.clients;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 247, 248, 1),
        ),
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  cacheExtent: 300,
                  itemCount: coins.length,
                  itemBuilder: (BuildContext context, int index) {
                    final client = coins[index];
                    return ItemList(clients: client);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
