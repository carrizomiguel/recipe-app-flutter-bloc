import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/ui/views/recipes/data/models/recipes_model.dart';
import 'package:recipe_app/ui/views/recipes/domain/repositories/recipe_repository.dart';

class GetRandomRecipe {
  final RecipeRepository repository;

  GetRandomRecipe(this.repository);

  Future<Either<Failure, RecipeModel>> call() async {
    return await repository.getRandomRecipe();
  }
}