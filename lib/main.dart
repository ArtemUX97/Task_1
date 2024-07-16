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

/// Todo(artemizaak):
/// - детально просмотреть, как шаг за шагом работают все вызовы. Это можно узнать
/// с помощью логирования (log или print)
/// - немного освоить графический git в AS

/// todo(artemizaak, 11.07.2024):
/// - внедрить пагинацию (посмотри также, что такое моковые данные, чтобы не
/// получить запрет от сервера на количество запросов)
/// - выбрать любой другой апи с сайта, получить и отобразить данные на новой странице
/// - улучшить отображение значения стоимости, когда экран узок
/// - добавить текстовый заголовок в Appbar

