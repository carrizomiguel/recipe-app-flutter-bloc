import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/ui/views/recipes/data/models/recipes_model.dart';
import 'package:recipe_app/ui/views/recipes/domain/usecases/get_random_recipe.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetRandomRecipe getRandomRecipe;

  RecipesBloc({
    required this.getRandomRecipe
  }) : super(RecipesInitial());

  @override
  Stream<RecipesState> mapEventToState(RecipesEvent event) async* {
    if ( event is GetRandomRecipeEvent ) {
      yield* _mapRandomRecipeToState();
    }
  }

  Stream<RecipesState> _mapRandomRecipeToState() async* {
    yield Loading();
    final failureOrList = await getRandomRecipe();
    yield* _mapErrorOrListToState(failureOrList);
  }

  Stream<RecipesState> _mapErrorOrListToState(
    Either<Failure, RecipeModel> response
  ) async* {
    yield response.fold(
      (failure) => const Error('Internal Error'),
      (list) => Loaded(list)
    );
  }
}
