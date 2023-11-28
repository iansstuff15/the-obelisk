import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/core/constants/borderRadius.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/presentation/page/application/categories/categories.page.dart';
import 'package:the_obelisk/feature/presentation/page/application/home/home.page.dart';
import 'package:the_obelisk/feature/presentation/page/application/profile/profile.page.dart';
import 'package:the_obelisk/feature/presentation/page/application/search/search.page.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/nav-button.widgets.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    String path = currentRoute!.settings.name!;
    return Container(
      height: AppSizes.large,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.tweenSmall,
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.medium),
      decoration:
          BoxDecoration(color: Colors.black, borderRadius: AppBorderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavButton(
              onPressed: () {
                AppRouter.replaceNoAnimation(
                    context: context, route: HomePage.id);
              },
              icon: path == HomePage.id
                  ? Icons.home_filled
                  : Icons.home_outlined),
          NavButton(
              onPressed: () {
                AppRouter.replaceNoAnimation(
                    context: context, route: CategoriesPage.id);
              },
              icon: path == CategoriesPage.id
                  ? EvaIcons.grid
                  : EvaIcons.gridOutline),
          NavButton(
              onPressed: () {
                AppRouter.replaceNoAnimation(
                    context: context, route: SearchPage.id);
              },
              icon:
                  path == SearchPage.id ? Icons.search : Icons.search_outlined),
          NavButton(
            onPressed: () {
              AppRouter.replaceNoAnimation(
                  context: context, route: ProfilePage.id);
            },
            icon: path == ProfilePage.id
                ? EvaIcons.person
                : EvaIcons.personOutline,
          ),
        ],
      ),
    );
  }
}
