import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';

class NewsPageHero extends StatefulWidget {
  String? image;
  NewsPageHero({super.key, required this.image});

  @override
  State<NewsPageHero> createState() => _NewsPageHeroState();
}

class _NewsPageHeroState extends State<NewsPageHero> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.extraLarge2 * 1.5,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.image!,
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
        ],
      ),
    );
  }
}
