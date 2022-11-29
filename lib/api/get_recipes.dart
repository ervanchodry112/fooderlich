import 'dart:convert' as convert;
import 'package:fooderlich/models/models.dart';
import 'package:http/http.dart' as http;

class GetRecipes {
  static var URL = Uri.https('uji.fmipa.unila.ac.id', '/api-test/recipes.json');

  static Future<List<SimpleRecipe>> getRecipes() async {
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = convert.jsonDecode(response.body);
      print(response.body);
      if (json['recipes'] != null) {
        final recipes = <SimpleRecipe>[];
        json['recipes'].foreach((v) {
          recipes.add(SimpleRecipe.fromJson(v));
        });
        print(recipes[3].title);
        return recipes;
      } else {
        return [];
      }
    }
    return [];

    // return response;
  }
}
