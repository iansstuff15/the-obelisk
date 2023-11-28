abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

abstract class FindUseCase<Type, Params> {
  Future<Type> call({Params params, required String query});
}
