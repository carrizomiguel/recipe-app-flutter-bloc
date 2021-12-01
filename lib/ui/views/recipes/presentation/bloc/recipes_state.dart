part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();
  
  @override
  List<Object> get props => [];
}

class RecipesInitial extends RecipesState {}

class Loading extends RecipesState {}

class Loaded extends RecipesState {
  final RecipeModel recipe;

  const Loaded(this.recipe);
}

class Error extends RecipesState {
  final String message;

  const Error(this.message);
}
