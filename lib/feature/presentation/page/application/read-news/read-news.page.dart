import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/core/util/date.dart';
import 'package:the_obelisk/core/util/urlLauncher.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/icon_button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';
import 'package:the_obelisk/feature/presentation/widgets/newspage-hero/hero.widgets.dart';
import 'package:the_obelisk/feature/presentation/widgets/sections/popular-news/popular-news.dart';

class ReadNews extends HookWidget {
  static String id = "Read News";

  const ReadNews({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleEntity article =
        ModalRoute.of(context)!.settings.arguments as ArticleEntity;
    return AppScaffold(
      bottomNavPosition: FloatingActionButtonLocation.endDocked,
      customBottomNav: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppIconButton(
            onPressed: () {},
            icon: Icons.share,
            isPrimary: true,
          ),
          SizedBox(
            width: AppSizes.extraSmall,
          ),
          AppElevatedButton(
            onPressed: () {
              Launch.web(url: article.url!);
            },
            isPrimary: true,
            child: const Text("Source"),
          ),
        ],
      ),
      includeTopSafeArea: false,
      showAppBar: true,
      child: Column(
        children: [
          NewsPageHero(
            image: article.urlToImage,
          ),
          SizedBox(height: AppSizes.mediumLarge),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(article.title!,
                    style: GoogleFonts.besley(
                        fontSize: AppSizes.mediumSmall,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: AppSizes.extraSmall),
                Text(
                  "${article.author}, ${DateUtil.formatDateTime(dateTime: article.publishedAt!)}",
                  style: TextStyle(fontSize: AppSizes.small),
                ),
                SizedBox(height: AppSizes.medium),
                Text("${article.content}"),
              ],
            ),
          ),
          const PopularNewsSection(),
          SizedBox(height: AppSizes.large),
        ],
      ),
    );
  }
}
