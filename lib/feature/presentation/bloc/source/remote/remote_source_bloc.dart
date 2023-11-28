import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_obelisk/core/resources/data_state.dart';
import 'package:the_obelisk/feature/domain/usecases/article/get_article.dart';
import 'package:the_obelisk/feature/domain/usecases/source/get_source.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:the_obelisk/feature/presentation/bloc/source/remote/remote_source_event.dart';
import 'package:the_obelisk/feature/presentation/bloc/source/remote/remote_source_state.dart';

class RemoteSourceBloc extends Bloc<RemoteSourceEvent, RemoteSourceState> {
  final GetSourceUseCase _getSourceUseCase;

  RemoteSourceBloc(this._getSourceUseCase)
      : super(const RemoteSourceLoading()) {
    on<GetSources>(onSources);
  }

  void onSources(GetSources event, Emitter<RemoteSourceState> emit) async {
    final dataState = await _getSourceUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteSourceDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteSourcesError(dataState.error!));
    }
  }
}
