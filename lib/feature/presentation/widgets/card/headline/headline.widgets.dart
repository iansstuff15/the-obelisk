import 'package:flutter/material.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/core/util/date.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';

class Headline extends StatefulWidget {
  final ArticleEntity? article;
  final bool? isRemovable;
  final void Function(ArticleEntity article)? onRemove;
  final void Function(ArticleEntity article)? onArticlePressed;
  const Headline({
    super.key,
    required this.article,
    this.onArticlePressed,
    this.isRemovable = false,
    this.onRemove,
  });

  @override
  State<Headline> createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.routeToArticleDetails(
            context: context, article: widget.article!);
      },
      child: SizedBox(
        height: AppSizes.getHeight(context) * 0.45,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.article!.urlToImage!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Black Overlay
            Container(
              color: Colors.black.withOpacity(0.75),
            ),
            // Content
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.article!.title}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.small,
                    ),
                  ),
                  Text(
                    "Tom Fornelli, November 25, 2023",
                    style: TextStyle(
                        color: Colors.white, fontSize: AppSizes.small),
                  ),
                  SizedBox(height: AppSizes.extraSmall),
                  Text(
                    "${widget.article!.author ?? ""}, ${DateUtil.formatDateTime(dateTime: widget.article!.publishedAt!)}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: AppSizes.medium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
