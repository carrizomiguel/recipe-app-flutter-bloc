import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/ui/views/recipes/data/datasources/recipes_local_data_source.dart';
import 'package:recipe_app/ui/views/recipes/data/datasources/recipes_remote_data_source.dart';
import 'package:recipe_app/ui/views/recipes/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_app/ui/views/recipes/domain/repositories/recipe_repository.dart';
import 'package:recipe_app/ui/views/recipes/domain/usecases/get_random_recipe.dart';
import 'package:recipe_app/ui/views/recipes/presentation/bloc/recipes_bloc.dart';
import 'package:recipe_app/ui/views/recipes/presentation/widgets/get_random_recipe_initial.dart';
import 'package:recipe_app/ui/views/recipes/presentation/widgets/info_random_recipe.dart';

class RandomRecipePage extends StatelessWidget {
  const RandomRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipeLocalDataSourceImpl localDataSource = RecipeLocalDataSourceImpl();
    RecipeRemoteDataSourceImpl remoteDataSource = RecipeRemoteDataSourceImpl();
    NetworkInfoImpl networkInfo = NetworkInfoImpl();
    RecipeRepository repository = RecipeRepositoryImpl(
      localDataSource: localDataSource,
      networkInfo: networkInfo,
      remoteDataSource: remoteDataSource
    );
    GetRandomRecipe getRandomRecipe = GetRandomRecipe(repository);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ( _ ) => RecipesBloc(getRandomRecipe: getRandomRecipe),
        )
      ],
      child: RandomRecipeView(key: key,)
    );
  }
}

class RandomRecipeView extends StatelessWidget {
  const RandomRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          if (state is Loaded) {
            return SingleChildScrollView(
              child: InfoRandomRecipe(
                model: state.recipe,
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is RecipesInitial)
                GetRandomRecipeInitial(
                  onPressed: () => context.read<RecipesBloc>().add(GetRandomRecipeEvent()),
                ),
              if (state is Loading) const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                )
              ),
            ],
          );
        },
      )
    );
  }
}
