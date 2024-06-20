import 'package:flutter/material.dart';
import 'package:task_1/List/model.dart';

import 'List/repository.dart';

// todo(20.06.2024):
// 1. Вынести логику, которая в initState в ChangeNotifier
// 2. Посмотреть на sealed классы и что они из себя представляют
// 3. Если не используем sealed классы, то тогда подумать о флаге isLoading внутри нотифаера, который будешь менять ручками
// 4. Посмотреть, как реализовывается `RefreshIndicator`
// 5. Заменить `CoinsModel` на обычный лист `List<Clients>` и использовать именно его в нотифаере

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CoinsModel coins = CoinsModel(clients: []);

  @override
  void initState() {
    super.initState();

    ApiServices().getCoinsModel().then(
          (value) => setState(() => coins = value ?? coins),
        );
  }

  @override
  Widget build(BuildContext context) {
    print(coins.clients);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 247, 248, 1),
        ),
        child: Column(
          children: [
            coins.clients.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: coins.clients.length,
                      itemBuilder: (context, index) {
                        final client = coins.clients[index];
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListTile(
                            title: Text(
                              client.name.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              client.symbol.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Text(
                              client.priceUsd.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text('Обновить данные'),
            ),
            const SizedBox(height: 16),
            // Text(Provider.of<CoinsState>(context).cState.toString()),
          ],
        ),
      ),
    );
  }
}
