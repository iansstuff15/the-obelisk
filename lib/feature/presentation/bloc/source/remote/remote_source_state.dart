import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';

abstract class RemoteSourceState extends Equatable {
  final List<SourceEntity>? sources;
  final DioError? error;

  const RemoteSourceState({this.sources, this.error});

  @override
  List<Object> get props => [sources!, error!];
}

class RemoteSourceLoading extends RemoteSourceState {
  const RemoteSourceLoading();
}

class RemoteSourceDone extends RemoteSourceState {
  const RemoteSourceDone(List<SourceEntity> source) : super(sources: source);
}

class RemoteSourcesError extends RemoteSourceState {
  const RemoteSourcesError(DioError error) : super(error: error);
}
