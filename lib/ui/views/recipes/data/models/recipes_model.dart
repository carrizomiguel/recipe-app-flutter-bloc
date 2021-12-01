import 'dart:convert';
import 'package:recipe_app/ui/views/recipes/domain/entities/recipes.dart';

RecipesModel recipesFromJson(String str) => RecipesModel.fromJson(json.decode(str));

class RecipesModel {
  RecipesModel({
    required this.recipes
  });

  List<RecipeModel> recipes;

  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
    recipes: List<RecipeModel>.from(json["recipes"].map((x) => RecipeModel.fromJson(x))),
  );
}

class RecipeModel extends Recipe {
  RecipeModel({
    required bool vegetarian,
    required bool vegan,
    required bool glutenFree,
    required bool dairyFree,
    required bool veryHealthy,
    required bool cheap,
    required bool veryPopular,
    required bool sustainable,
    required int weightWatcherSmartPoints,
    required String gaps,
    required bool lowFodmap,
    required int aggregateLikes,
    required double spoonacularScore,
    required double healthScore,
    required String creditsText,
    required String? license,
    required String? sourceName,
    required double pricePerServing,
    required int id,
    required String title,
    required int readyInMinutes,
    required int servings,
    required String sourceUrl,
    required String image,
    required String imageType,
    required String summary,
    required String instructions,
    required dynamic originalId,
    required String spoonacularSourceUrl
  }) : super(
    vegetarian: vegetarian,
    vegan: vegan,
    glutenFree: glutenFree,
    dairyFree: dairyFree,
    veryHealthy: veryHealthy,
    cheap: cheap,
    veryPopular: veryPopular,
    sustainable: sustainable,
    weightWatcherSmartPoints: weightWatcherSmartPoints,
    gaps: gaps,
    lowFodmap: lowFodmap,
    aggregateLikes: aggregateLikes,
    spoonacularScore: spoonacularScore,
    healthScore: healthScore,
    creditsText: creditsText,
    license: license,
    sourceName: sourceName,
    pricePerServing: pricePerServing,
    id: id,
    title: title,
    readyInMinutes: readyInMinutes,
    servings: servings,
    sourceUrl: sourceUrl,
    image: image,
    imageType: imageType,
    summary: summary,
    instructions: instructions,
    originalId: originalId,
    spoonacularSourceUrl: spoonacularSourceUrl,
  );

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    vegetarian: json["vegetarian"],
    vegan: json["vegan"],
    glutenFree: json["glutenFree"],
    dairyFree: json["dairyFree"],
    veryHealthy: json["veryHealthy"],
    cheap: json["cheap"],
    veryPopular: json["veryPopular"],
    sustainable: json["sustainable"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    gaps: json["gaps"],
    lowFodmap: json["lowFodmap"],
    aggregateLikes: json["aggregateLikes"],
    spoonacularScore: json["spoonacularScore"],
    healthScore: json["healthScore"],
    creditsText: json["creditsText"],
    license: json["license"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"].toDouble(),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    image: json["image"],
    imageType: json["imageType"],
    summary: json["summary"],
    instructions: json["instructions"],
    originalId: json["originalId"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
  );

  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "lowFodmap": lowFodmap,
        "aggregateLikes": aggregateLikes,
        "spoonacularScore": spoonacularScore,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "license": license,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "image": image,
        "imageType": imageType,
        "summary": summary,
        "instructions": instructions,
        "originalId": originalId,
        "spoonacularSourceUrl": spoonacularSourceUrl,
    };
}