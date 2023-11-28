import 'package:flutter/material.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/core/util/date.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';

class NewsListItem extends StatefulWidget {
  final ArticleEntity? article;
  final bool? isRemovable;
  final void Function(ArticleEntity article)? onRemove;
  final void Function(ArticleEntity article)? onArticlePressed;
  const NewsListItem({
    super.key,
    required this.article,
    this.onArticlePressed,
    this.isRemovable = false,
    this.onRemove,
  });

  @override
  State<NewsListItem> createState() => _NewsListItemState();
}

class _NewsListItemState extends State<NewsListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.routeToArticleDetails(
            context: context, article: widget.article!);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.extraSmall),
            child: Image.network(
              widget.article!.urlToImage!,
              fit: BoxFit.cover,
              width: AppSizes.extraLarge,
              height: AppSizes.extraLarge,
            ),
          ),
          SizedBox(
            width: AppSizes.extraSmall,
          ),
          SizedBox(
            width: AppSizes.getWitdth(context) * 0.49,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.article!.title}",
                  maxLines: 4, // Set the maximum number of lines
                  overflow: TextOverflow.ellipsis, // Truncate with ellipsis
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.tweenSmall,
                  ),
                ),
                Text(
                  "${widget.article!.author ?? ""}, ${DateUtil.formatDateTime(dateTime: widget.article!.publishedAt!)}",
                  style: TextStyle(fontSize: AppSizes.tweenSmall),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
