import 'package:recipe_app/core/error/exceptions.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/ui/views/recipes/data/datasources/recipes_local_data_source.dart';
import 'package:recipe_app/ui/views/recipes/data/datasources/recipes_remote_data_source.dart';
import 'package:recipe_app/ui/views/recipes/data/models/recipes_model.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipe_app/ui/views/recipes/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeLocalDataSource localDataSource;
  final RecipeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecipeRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, RecipeModel>> getRandomRecipe() async {
    if ( await networkInfo.isWifiConnected ) {
      try {
        final remoteRecipe = await remoteDataSource.getRandomRecipe();
        localDataSource.cacheRecipeModel(remoteRecipe);
        return Right(remoteRecipe);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRecipe = await localDataSource.getRecipeModel();
        return Right(localRecipe);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}