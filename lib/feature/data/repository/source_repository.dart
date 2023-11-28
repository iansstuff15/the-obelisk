import 'dart:io';

import 'package:dio/dio.dart';
import 'package:the_obelisk/core/constants/appConstants.dart';
import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/feature/data/datasource/local/app_database.dart';
import 'package:the_obelisk/feature/data/datasource/remote/news_api_service.dart';
import 'package:the_obelisk/feature/data/model/article_model.dart';
import 'package:the_obelisk/feature/data/model/source_model.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';
import 'package:the_obelisk/feature/domain/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  SourceRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<SourceModel>>> getSources() async {
    try {
      final httpResponse = await _newsApiService.getNewsSource(
        apiKey: newsAPIKey,
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
  @override
  Future<void> removeSource(SourceEntity source) {
    return _appDatabase.sourceDao.deleteSource(SourceModel.fromEntity(source));
  }

  @override
  Future<void> saveSource(SourceEntity source) {
    return _appDatabase.sourceDao.insertSource(SourceModel.fromEntity(source));
  }

  @override
  Future<List<SourceEntity>> getSavedSources() {
    // TODO: implement getSavedSources
    throw UnimplementedError();
  }
}
