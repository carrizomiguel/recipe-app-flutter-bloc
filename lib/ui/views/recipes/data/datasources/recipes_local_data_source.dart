import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/core/error/exceptions.dart';
import 'package:recipe_app/ui/views/recipes/data/models/recipes_model.dart';

abstract class RecipeLocalDataSource {
  Future<RecipeModel> getRecipeModel();
  Future<void> cacheRecipeModel(RecipeModel model);
}

const cachedRecipeModel = 'CACHED_RECIPE_MODEL';

class RecipeLocalDataSourceImpl extends RecipeLocalDataSource {
  final GetStorage box = GetStorage();

  @override
  Future<void> cacheRecipeModel(RecipeModel model) async {
    await box.write(cachedRecipeModel, model);
  }

  @override
  Future<RecipeModel> getRecipeModel() async {
    final jsonString = await box.read(cachedRecipeModel);
    if ( jsonString != null ) {
      return Future.value(RecipeModel.fromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

}