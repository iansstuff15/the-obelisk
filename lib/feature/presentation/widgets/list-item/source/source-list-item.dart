import 'package:flutter/material.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/core/util/date.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/domain/entity/source.dart';

class SourceListItem extends StatefulWidget {
  final SourceEntity? source;
  final bool? isRemovable;
  final void Function(SourceEntity article)? onRemove;
  final void Function(SourceEntity article)? onArticlePressed;
  const SourceListItem({
    super.key,
    required this.source,
    this.onArticlePressed,
    this.isRemovable = false,
    this.onRemove,
  });

  @override
  State<SourceListItem> createState() => _SourceListItemState();
}

class _SourceListItemState extends State<SourceListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
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
                  "${widget.source!.name}",
                  maxLines: 4, // Set the maximum number of lines
                  overflow: TextOverflow.ellipsis, // Truncate with ellipsis
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.tweenSmall,
                  ),
                ),
                Text(
                  "${widget.source!.category ?? ""}, ${widget.source!.language!}-${widget.source!.country!}",
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
