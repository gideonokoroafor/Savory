import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../services/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe(String limit) async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": limit, "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": dotenv.env["RAPID_API_KEY"]!,
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List details = [];
    List steps = [];
    List description = [];
    for (var i in data['feed']) {
      details.add(i['content']['details']);
      steps.add(i['content']['preparationSteps'] ?? []);
      description.add(i['content']['description']);
    }
    return Recipe.recipesFromSnapshot(details, steps, description);
  }

  // static Future<List<Recipe>> getTags() async {
  //   var uri = Uri.https(
  //       'yummly2.p.rapidapi.com', '/tags/list', {"limit": "18", "start": "0"});
  //   final response = await http.get(uri, headers: {
  //     "x-rapidapi-key": dotenv.env["RAPID_API_KEY"]!,
  //     "x-rapidapi-host": "yummly2.p.rapidapi.com",
  //     "useQueryString": "true"
  //   });
  //   Map data = jsonDecode(response.body);
  //   List temp = [];
  //   for (var i in data['feed']) {
  //     temp.add(i['content']['details']);
  //   }
  //   return Recipe.recipesFromSnapshot(temp);
  // }
}
