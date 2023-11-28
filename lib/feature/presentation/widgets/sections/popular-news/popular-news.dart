import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/widgets/bloc-builder/article/article-bloc-builder.widget.dart';

class PopularNewsSection extends StatefulWidget {
  const PopularNewsSection({super.key});

  @override
  State<PopularNewsSection> createState() => _PopularNewsSectionState();
}

class _PopularNewsSectionState extends State<PopularNewsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSizes.medium, top: AppSizes.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular News",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppSizes.mediumSmall),
          ),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: AppSizes.getWitdth(context),
                  maxHeight: AppSizes.extraLarge * 1.7),
              child: ArticleBlocBuilder(
                type: NewsComponentType.CARD,
                direction: Axis.horizontal,
                limit: 5,
              )),
        ],
      ),
    );
  }
}
