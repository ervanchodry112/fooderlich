import 'package:flutter/material.dart';
import 'package:fooderlich/Models/CardModel.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';
import 'fooderlich_theme.dart';
import 'home.dart';
import 'MyInheritedWidget.dart';

void main() {
  runApp(MyInheritedWidget(
    model: CardModel(isFavorite: false),
    child: Fooderlich(),
  ));
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TabManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => GroceryManager(),
          ),
        ],
        builder: (context, child) {
          return Home();
        },
      ),
    );
  }
}
