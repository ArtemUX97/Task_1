import 'package:flutter/material.dart';
import 'List/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 247, 248, 1),
        ),
        child: ListView(
          children: const [
            ItemList(),
            ItemList(),
          ],
        ),
      ),
    );
  }
}
