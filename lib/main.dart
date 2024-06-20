import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/screen.dart';

void main() {
  runApp(
    Provider(
      create: (context) => CoinsState,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(246, 247, 248, 1),
          ),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    ),
  );
}

class CoinsState extends ChangeNotifier {
  var cState = 20;

  void reload() {
    cState++;
    notifyListeners();
  }
}