import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:the_obelisk/feature/presentation/bloc/source/remote/remote_source_bloc.dart';
import 'package:the_obelisk/feature/presentation/bloc/source/remote/remote_source_state.dart';
import 'package:the_obelisk/feature/presentation/widgets/card/headline/headline.widgets.dart';
import 'package:the_obelisk/feature/presentation/widgets/card/news/news-card.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/list-item/news/news-list-item.dart';
import 'package:the_obelisk/feature/presentation/widgets/list-item/source/source-list-item.dart';

class SourceBlocBuilder extends StatefulWidget {
  Axis? direction;
  int? limit;
  SourceBlocBuilder({super.key, required this.direction, this.limit = 1});

  @override
  State<SourceBlocBuilder> createState() => _SourceBlocBuilderState();
}

class _SourceBlocBuilderState extends State<SourceBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteSourceBloc, RemoteSourceState>(
      builder: (_, state) {
        if (state is RemoteSourceLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteSourcesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteSourceDone) {
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppSizes.small,
              );
            },
            itemBuilder: (context, index) {
              return SourceListItem(source: state.sources![index]);
            },
            itemCount: state.sources!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
