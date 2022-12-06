import 'dart:convert' as convert;
import 'package:fooderlich/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GetRecipes {
  static var URL = Uri.https('uji.fmipa.unila.ac.id', '/api-test/recipes.json');
  static var dio = Dio();

  static Future<List<SimpleRecipe>> getRecipes() async {
    // final response = await http.get(URL);
    final response =
        await dio.get('https://uji.fmipa.unila.ac.id/api-test/recipes.json');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = convert.jsonDecode(response.toString());
      // final Map<String, dynamic> json = convert.jsonDecode(response.body);
      // print(response.body);

      if (json['recipes'] != null) {
        final recipes = <SimpleRecipe>[];
        json['recipes'].forEach((v) {
          recipes.add(SimpleRecipe.fromJson(v));
        });
        return recipes;
      } else {
        return [];
      }
    }

    return [];

    // return response;
  }
}
