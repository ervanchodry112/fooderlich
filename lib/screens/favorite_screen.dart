import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooderlich/db/db_provider.dart';

import '../components/components.dart';
import '../models/models.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Recipes"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DBProvider.db.getAllResep(),
        builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RecipesGridView(recipes: snapshot.data ?? []);
          }
        },
      ),
    );
  }
}
