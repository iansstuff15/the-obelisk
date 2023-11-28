import 'package:floor/floor.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';

@Entity(tableName: 'sources', primaryKeys: ['id'])
class SourceModel extends SourceEntity {
  const SourceModel({
    super.id,
    super.category,
    super.description,
    super.country,
    super.language,
    super.name,
    super.url,
  });

  factory SourceModel.fromJson(Map<String, dynamic> map) {
    return SourceModel(
      id: map['id'] ?? "No id found",
      category: map['category'] ?? "No category found",
      description: map['description'] ?? "No description found",
      url: map['url'] ?? "No url found",
      country: map['country'] ?? "No country found",
      language: map['language'] ?? "No language found",
      name: map['name'] ?? 'no name found',
    );
  }

  factory SourceModel.fromEntity(SourceEntity entity) {
    return SourceModel(
        id: entity.id,
        category: entity.category,
        description: entity.description,
        country: entity.country,
        language: entity.language,
        url: entity.url,
        name: entity.name);
  }
}
