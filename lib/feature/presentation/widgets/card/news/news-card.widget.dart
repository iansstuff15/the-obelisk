import 'package:flutter/material.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/config/sizes.config.dart';
import 'package:the_obelisk/core/util/date.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';

class NewsCard extends StatefulWidget {
  final ArticleEntity? article;
  final bool? isRemovable;
  final void Function(ArticleEntity article)? onRemove;
  final void Function(ArticleEntity article)? onArticlePressed;
  const NewsCard({
    super.key,
    required this.article,
    this.onArticlePressed,
    this.isRemovable = false,
    this.onRemove,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          AppRouter.routeToArticleDetails(
              context: context, article: widget.article!);
        },
        child: SizedBox(
            height: AppSizes.extraLarge2,
            width: AppSizes.extraLarge2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.extraSmall),
                  child: Image.network(
                    widget.article!.urlToImage!,
                    fit: BoxFit.cover,
                    height: AppSizes.extraLarge,
                  ),
                ),
                SizedBox(
                  height: AppSizes.extraSmall,
                ),
                Text(
                  "${widget.article!.title}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.article!.author ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                    DateUtil.formatDateTime(dateTime: widget.article!.publishedAt!)),
                SizedBox(height: AppSizes.extraSmall),
              ],
            )));
  }
}
