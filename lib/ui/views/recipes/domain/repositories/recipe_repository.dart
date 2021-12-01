import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/ui/views/recipes/data/models/recipes_model.dart';

abstract class RecipeRepository {
  Future<Either<Failure, RecipeModel>> getRandomRecipe();
}