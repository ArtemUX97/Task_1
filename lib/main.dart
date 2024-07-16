import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/firstPage/controller.dart';
import 'homePage.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => CoinsNotifier()..init(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}


