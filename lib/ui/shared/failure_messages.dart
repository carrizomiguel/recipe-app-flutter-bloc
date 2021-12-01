import 'package:recipe_app/core/error/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ConnectionFailure:
      return 'Connection Error!';
    case ServerFailure:
      return 'Server Error!';
    case CacheFailure:
      return 'Cache Error!';
    default:
      return 'Unexpected Error!';
  }
}