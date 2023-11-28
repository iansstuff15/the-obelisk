import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';

abstract class SourceRepository {
  Future<DataState<List<SourceEntity>>> getSources();

  Future<List<SourceEntity>> getSavedSources();

  Future<void> saveSource(SourceEntity source);

  Future<void> removeSource(SourceEntity source);
}
