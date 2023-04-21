import 'dart:convert';

import 'package:english_words/english_words.dart';
import 'package:firstapp/src/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier { // ChangeNotifier is the easiest way to manage state in a flutter application
  var current = WordPair.random();
  String col = 'redAccent';
  var favorites = <WordPair>[];
  // GlobalKey? historyListKey;
  // var history = <WordPair>[];
  late dynamic dataApiHolder = [];

  void getNext() {
    // history.insert(0, current);
    // var animatedList = historyListKey?.currentState as AnimatedListState?;
    // animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners(); // ensures that anyone using the MyAppState state is notified the changes that have taken place
  }

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
    print(favorites);
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }

  Future<void> getGreeting() async {
    try {
      Response response = await get(Uri.parse("https://www.greetingsapi.com/random"));
      Map data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        dataApiHolder.add(data);
        notifyListeners();
      }
      print(dataApiHolder);

    } catch (e) {
      print(e.toString());
    }
  }
}



