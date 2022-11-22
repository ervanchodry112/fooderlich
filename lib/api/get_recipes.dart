import 'dart:convert' as convert;
import 'package:fooderlich/models/models.dart';
import 'package:http/http.dart' as http;

class GetRecipes {
  static var URL = Uri.https('uji.fmipa.unila.ac.id', '/api-test/recipes.json');

  static Future getRecipes() async {
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = convert.jsonDecode(response.body);

      if (json['recipes'] != null) {
        final recipes = <ExploreRecipe>[];
        json['recipes'].foreach((v) {
          recipes.add(ExploreRecipe.fromJson(v));
        });
        print(recipes[3].title);
        return recipes;
      } else {
        return [];
      }
    }

    return response;
  }
}
