import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
  Future<DataState<List<ArticleEntity>>> findArticle({required String query});
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
