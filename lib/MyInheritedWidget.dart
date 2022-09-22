import 'package:flutter/material.dart';
import 'Models/CardModel.dart';

class MyInheritedWidget extends InheritedWidget {
  final CardModel model;
  final Widget child;
  const MyInheritedWidget({Key? key, required this.model, required this.child})
      : super(key: key, child: child);

  static MyInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return true;
  }
}
