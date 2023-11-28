import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/feature/domain/usecases/article/find_article.dart';
import 'package:the_obelisk/feature/domain/usecases/article/get_article.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;
  final FindArticleUseCase _findArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase, this._findArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
    on<FindArticles>(onFindArticles); // Corrected line
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }

  void onFindArticles(
      FindArticles event, Emitter<RemoteArticlesState> emit) async {
    // Corrected method signature
    final dataState = await _findArticleUseCase(query: event.query);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
