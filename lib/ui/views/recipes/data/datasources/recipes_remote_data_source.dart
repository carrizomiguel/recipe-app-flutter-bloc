import 'dart:io';

import 'package:recipe_app/core/error/exceptions.dart';
import 'package:recipe_app/core/network/api_info.dart';
import 'package:recipe_app/ui/views/recipes/data/models/recipes_model.dart';
import 'package:http/http.dart' as http;

abstract class RecipeRemoteDataSource {
  Future<RecipeModel> getRandomRecipe();
}

class RecipeRemoteDataSourceImpl extends RecipeRemoteDataSource {
  String api = Api.authority;
  String apiKey = Api.apiKey;
  String randomPath = Api.random;

  @override
  Future<RecipeModel> getRandomRecipe() async {
    final response = await http.get(
      Uri.https(api, randomPath, { "apiKey": apiKey }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if ( response.statusCode == 200 ) {
      RecipesModel array = recipesFromJson(response.body);
      return array.recipes.first;
    } else {
      throw ServerException();
    }
  }
}