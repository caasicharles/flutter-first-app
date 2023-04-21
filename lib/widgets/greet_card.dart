import 'dart:math';

import 'package:firstapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GreetCard extends StatelessWidget {
  const GreetCard({super.key});
  

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var formalGreetings = appState.dataApiHolder;
    var random = Random();
    String empty = '';
    formalGreetings.length == 0 ? empty = 'Empty List': formalGreetings = formalGreetings[random.nextInt(formalGreetings.length)];
    // String greeting = appState.dataApiHolder!["greeting"];
    // String language = appState.dataApiHolder!["language"];
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: MergeSemantics(
            child: Wrap(
              alignment: WrapAlignment.center,
              verticalDirection: VerticalDirection.up,
              runAlignment: WrapAlignment.center,
              children: [
                // TextFormField(
                //   controller: TextEditingController(),
                //   onChanged: (value) => {
                //     print(empty)
                //     print(formalGreetings['language'])
                //   },
                // )
                empty != '' ? Text(empty, style: style,) :
                  Column(
                    children: [
                      Text(
                        formalGreetings['greeting'], 
                        style: style.copyWith(fontWeight: FontWeight.normal, fontSize:  22.0 ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        formalGreetings['language'],
                        style: style.copyWith(fontWeight: FontWeight.bold, fontSize:  16.0),
                      ),
                    ],
                  )                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}


