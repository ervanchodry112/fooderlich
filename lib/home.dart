import 'package:flutter/material.dart';
import 'package:fooderlich/screens/recipe_screens.dart';
import 'models/explore_recipe.dart';
import 'components/components.dart';
import 'screens/explore_screen.dart';
import 'screens/grocery_screens.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static bool isFavorited = false;
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text('Fooderlich',
                    style: Theme.of(context).textTheme.headline6)),
            body: IndexedStack(index: tabManager.selectedTab, children: pages),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:
                    Theme.of(context).textSelectionTheme.selectionColor,
                currentIndex: tabManager.selectedTab,
                onTap: (index) {
                  tabManager.goToTab(index);
                },
                // ignore: prefer_const_literals_to_create_immutables
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Card'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.receipt), label: 'Card2'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Card3'),
                ]));
      },
    );
  }
}
