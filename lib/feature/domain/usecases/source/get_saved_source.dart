import 'package:the_obelisk/core/usecase/usercase.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';
import 'package:the_obelisk/feature/domain/repository/source_repository.dart';

class GetSavedSourceUseCase implements UseCase<List<SourceEntity>, void> {
  final SourceRepository _sourceRepository;

  GetSavedSourceUseCase(this._sourceRepository);

  @override
  Future<List<SourceEntity>> call({void params}) {
    return _sourceRepository.getSavedSources();
  }
}
