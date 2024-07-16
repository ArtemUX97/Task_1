import 'package:flutter/material.dart';
import 'package:task_1/secondPage/screenSecond.dart';

import 'firstPage/screenFirst.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final screens = [
    const ScreenFirst(),
    const ScreenSecond(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ApiServices"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Страница 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Страница 2',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}