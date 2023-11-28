import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:the_obelisk/feature/presentation/widgets/card/headline/headline.widgets.dart';
import 'package:the_obelisk/feature/presentation/widgets/card/news/news-card.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/list-item/news/news-list-item.dart';

class ArticleBlocBuilder extends StatefulWidget {
  NewsComponentType? type;
  Axis? direction;
  int? limit;
  ArticleBlocBuilder(
      {super.key, required this.type, required this.direction, this.limit = 1});

  @override
  State<ArticleBlocBuilder> createState() => _ArticleBlocBuilderState();
}

class _ArticleBlocBuilderState extends State<ArticleBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return Center(child: Text("${state.error?.toString()}"));
        }
        if (state is RemoteArticlesDone) {
          switch (widget.type) {
            case NewsComponentType.HEADLINE:
              return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: AppSizes.small,
                  );
                },
                itemBuilder: (context, index) {
                  return Headline(article: state.articles![0]);
                },
                itemCount: widget.limit!,
              );
            case NewsComponentType.CARD:
              return ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.limit!,
                itemBuilder: (context, index) {
                  return NewsCard(
                    article: state.articles![index + 1],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: AppSizes.small,
                  );
                },
              );
            case NewsComponentType.LIST:
              return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: AppSizes.small,
                  );
                },
                itemBuilder: (context, index) {
                  return NewsListItem(
                    article: state.articles![index + 5],
                  );
                },
                itemCount: widget.limit!,
              );

            default:
              return const Text("Error News Component Unknown Type");
          }
        }
        return const SizedBox();
      },
    );
  }
}
