import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/core/usecase/usercase.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';
import 'package:the_obelisk/feature/domain/repository/article_repository.dart';
import 'package:the_obelisk/feature/domain/repository/source_repository.dart';

class GetSourceUseCase implements UseCase<DataState<List<SourceEntity>>, void> {
  final SourceRepository _sourceRepository;

  GetSourceUseCase(this._sourceRepository);

  @override
  Future<DataState<List<SourceEntity>>> call({void params}) {
    return _sourceRepository.getSources();
  }
}
