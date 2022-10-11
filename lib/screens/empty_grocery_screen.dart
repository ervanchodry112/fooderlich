import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('/fooderlich_asssets/empty_list.png'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text('No Groceries', style: TextStyle(fontSize: 21.0)),
            const SizedBox(height: 16.0),
            const Text(
              'Shopping for Ingredients?\n'
              'Tap the + button to write them down',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                onPressed: () {
                  Provider.of<TabManager>(context, listen: false).goToRecipes();
                },
                child: const Text('Browse Recipes')),
          ],
        )));
  }
}