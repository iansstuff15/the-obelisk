import 'dart:io';

import 'package:dio/dio.dart';
import 'package:the_obelisk/core/constants/appConstants.dart';
import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/feature/data/datasource/local/app_database.dart';
import 'package:the_obelisk/feature/data/datasource/remote/news_api_service.dart';
import 'package:the_obelisk/feature/data/model/article_model.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<DataState<List<ArticleModel>>> findArticle(
      {required String query}) async {
    try {
      final httpResponse = await _newsApiService.findNewsArticle(
        apiKey: newsAPIKey,
        query: query,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
