import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/widgets/bloc-builder/article/article-bloc-builder.widget.dart';

class OtherNewsSection extends StatefulWidget {
  const OtherNewsSection({super.key});

  @override
  State<OtherNewsSection> createState() => _OtherNewsSectionState();
}

class _OtherNewsSectionState extends State<OtherNewsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Other News",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppSizes.mediumSmall),
          ),
          SizedBox(
            height: AppSizes.small,
          ),
          ArticleBlocBuilder(
            type: NewsComponentType.LIST,
            direction: Axis.vertical,
            limit: 10,
          )
        ],
      ),
    );
  }
}
