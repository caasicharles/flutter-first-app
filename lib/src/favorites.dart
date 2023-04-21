import 'package:firstapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var listOfFavorites = appState.favorites;
    if (listOfFavorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${listOfFavorites.length} favorites:'),
        ),
        for (var pair in listOfFavorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}