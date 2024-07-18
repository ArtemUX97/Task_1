import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'item_list.dart';

class ScreenFirst extends StatefulWidget {
  const ScreenFirst({super.key});

  @override
  State<ScreenFirst> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ScreenFirst> {
  @override
  Widget build(BuildContext context) {
    final coinsNotifier = Provider.of<CoinsNotifier>(context);
    final coinsState = coinsNotifier.value;

    print('ScreenFirst build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ScreenFirst"),
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
        CoinsErrorState() => const Center(child: Text('Error')),
      },
    );
  }
}
