import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/List/itemList.dart';

import 'List/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coinsNotifier = Provider.of<CoinsNotifier>(context);
    final coinsState = coinsNotifier.value;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      ),
      body: switch (coinsState) {
        CoinsDataState(:final coins) => Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: coinsNotifier.refresh,
                  child: ListView.builder(
                    cacheExtent: 300,
                    itemCount: coins.length,
                    itemBuilder: (BuildContext context, int index) {
                      final coin = coins[index];
                      return ItemList(coin: coin);
                    },
                  ),
                ),
              ),
            ],
          ),
        CoinsLoadingState() => const Center(child: CircularProgressIndicator()),
        CoinsErrorState() => const Center(child: Text('Прозошла ошибка')),
      },
    );
  }
}
