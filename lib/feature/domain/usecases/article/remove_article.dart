import 'package:the_obelisk/core/usecase/usercase.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
