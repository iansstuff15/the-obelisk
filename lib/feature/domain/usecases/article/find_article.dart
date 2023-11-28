import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/core/usecase/usercase.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';

class FindArticleUseCase
    implements FindUseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  FindArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call(
      {void params, required String query}) {
    return _articleRepository.findArticle(query: query);
  }
}
