import 'package:flutter/material.dart';
import 'package:fooderlich/Models/CardModel.dart';
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
    final theme = FooderlichTheme.dark();
    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      home: Home(),
    );
  }
}
