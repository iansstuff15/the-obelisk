import 'package:equatable/equatable.dart';

class SourceEntity extends Equatable {
  final String? id;
  final String? name;
  final String? category;
  final String? description;
  final String? url;
  final String? country;
  final String? language;

  const SourceEntity({
    this.id,
    this.name,
    this.category,
    this.description,
    this.url,
    this.country,
    this.language,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      url,
      country,
      language,
    ];
  }
}
