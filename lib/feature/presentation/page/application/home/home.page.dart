import 'package:flutter/material.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/widgets/bloc-builder/article/article-bloc-builder.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';
import 'package:the_obelisk/feature/presentation/widgets/sections/other-news/other-news.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/sections/popular-news/popular-news.dart';

class HomePage extends StatelessWidget {
  static String id = 'Home';
  const HomePage({super.key});
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    return;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: true,
      includeTopSafeArea: false,
      showHamburgerMenu: true,
      child: RefreshIndicator(
          onRefresh: onRefresh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleBlocBuilder(
                  type: NewsComponentType.HEADLINE, direction: Axis.vertical),
              const PopularNewsSection(),
              const OtherNewsSection(),
            ],
          )),
    );
  }
}
