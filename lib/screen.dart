import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'List/controller.dart';
import 'List/itemList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  Future _refresh(BuildContext context) async{
    return Provider.of<CoinsNotifier>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {

    final coinsNotifier = Provider.of<CoinsNotifier>(context);
    final coinsS = coinsNotifier.value;

    void mainCoins(CoinsState coinsState) {
      final msg = switch (coinsState) {
        CoinsLoadingState() => RefreshIndicator,
        CoinsDataState(coins: var coins) => 'Data',
        CoinsErrorState(message: var message) => 'Error',
      };
      print(msg);
    }

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
                    itemCount: coinsS.length,
                    itemBuilder: (BuildContext context, int index) {
                      final client = coinsS[index];
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
