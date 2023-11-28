import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:the_obelisk/feature/data/datasource/local/app_database.dart';
import 'package:the_obelisk/feature/data/datasource/remote/news_api_service.dart';
import 'package:the_obelisk/feature/data/repository/article_repository.dart';
import 'package:the_obelisk/feature/data/repository/source_repository.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';
import 'package:the_obelisk/feature/domain/repository/source_repository.dart';
import 'package:the_obelisk/feature/domain/usecases/article/find_article.dart';
import 'package:the_obelisk/feature/domain/usecases/article/get_article.dart';
import 'package:the_obelisk/feature/domain/usecases/article/get_saved_article.dart';
import 'package:the_obelisk/feature/domain/usecases/article/remove_article.dart';
import 'package:the_obelisk/feature/domain/usecases/article/save_article.dart';
import 'package:the_obelisk/feature/domain/usecases/source/get_saved_source.dart';
import 'package:the_obelisk/feature/domain/usecases/source/get_source.dart';
import 'package:the_obelisk/feature/domain/usecases/source/remove_source.dart';
import 'package:the_obelisk/feature/domain/usecases/source/save_source.dart';

import 'package:the_obelisk/feature/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:the_obelisk/feature/presentation/bloc/source/remote/remote_source_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  sl.registerSingleton<SourceRepository>(SourceRepositoryImpl(sl(), sl()));
  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSourceUseCase>(GetSourceUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<GetSavedSourceUseCase>(GetSavedSourceUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<SaveSourceUseCase>(SaveSourceUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));
  sl.registerSingleton<RemoveSourceUseCase>(RemoveSourceUseCase(sl()));

  sl.registerSingleton<FindArticleUseCase>(FindArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl(), sl()),
  );
  sl.registerFactory<RemoteSourceBloc>(() => RemoteSourceBloc(sl()));

  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
