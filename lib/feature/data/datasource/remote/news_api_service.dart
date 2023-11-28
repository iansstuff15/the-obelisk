import 'package:retrofit/retrofit.dart';
import 'package:the_obelisk/core/constants/appConstants.dart';
import 'package:the_obelisk/feature/data/model/article_model.dart';

import 'package:dio/dio.dart';
import 'package:the_obelisk/feature/data/model/source_model.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> findNewsArticle({
    @Query("apiKey") String? apiKey,
    @Query("q") String? query,
  });
  @GET('/top-headlines/sources')
  Future<HttpResponse<List<SourceModel>>> getNewsSource({
    @Query("apiKey") String? apiKey,
  });
}
