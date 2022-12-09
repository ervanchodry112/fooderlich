import 'package:flutter/material.dart';
import 'package:fooderlich/api/get_recipes.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class RecipesScreen extends StatefulWidget {
  RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final exploreService = MockFooderlichService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: exploreService.getRecipes(),
      future: GetRecipes.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
