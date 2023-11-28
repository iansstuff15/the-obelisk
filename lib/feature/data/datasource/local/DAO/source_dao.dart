import 'package:floor/floor.dart';
import 'package:the_obelisk/feature/data/model/article_model.dart';
import 'package:the_obelisk/feature/data/model/source_model.dart';

@dao
abstract class SourceDao {
  @Insert()
  Future<void> insertSource(SourceModel source);

  @delete
  Future<void> deleteSource(SourceModel sourceModel);

  @Query('SELECT * FROM source')
  Future<List<SourceModel>> getSources();
}
