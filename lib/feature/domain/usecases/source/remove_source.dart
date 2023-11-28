import 'package:the_obelisk/core/usecase/usercase.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';
import 'package:the_obelisk/feature/domain/repository/source_repository.dart';

class RemoveSourceUseCase implements UseCase<void, SourceEntity> {
  final SourceRepository _sourceRepository;

  RemoveSourceUseCase(this._sourceRepository);

  @override
  Future<void> call({SourceEntity? params}) {
    return _sourceRepository.removeSource(params!);
  }
}
