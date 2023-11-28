import 'package:flutter/material.dart';
import 'package:the_obelisk/feature/domain/entity/article.dart';
import 'package:the_obelisk/feature/presentation/page/application/read-news/read-news.page.dart';

class AppRouter {
  static void routeToArticleDetails(
      {required BuildContext context, required ArticleEntity article}) {
    Navigator.pushNamed(context, ReadNews.id, arguments: article);
  }

  static void push({required BuildContext context, required String route}) {
    Navigator.pushNamed(
      context,
      route,
    );
  }

  static void replace({required BuildContext context, required String route}) {
    Navigator.pushReplacementNamed(context, route);
  }

  static void replaceNoAnimation(
      {required BuildContext context, required String route}) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
