import 'package:firstapp/main.dart';
import 'package:firstapp/widgets/greet_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Greet extends StatelessWidget {
  const Greet({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          GreetCard(),
          SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {
              appState.getGreeting();
            },
            child: Text('Greet'),
          ),
        ],
      ),
    );
  }
}