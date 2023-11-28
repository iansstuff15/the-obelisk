import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/widgets/bloc-builder/article/article-bloc-builder.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/no-auth-login/login-form.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/continue-with-provider/continue-with-provider.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';

class NoAuthLoginPage extends StatelessWidget {
  static String id = "No Auth Login";
  const NoAuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      enableBottomNav: false,
      enableDrawer: false,
      showAppBar: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArticleBlocBuilder(
              type: NewsComponentType.HEADLINE, direction: Axis.vertical),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.small,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.besley(
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppSizes.medium),
                ),
                const LoginForm(),
                const ContinueWithProvider()
              ],
            ),
          )
        ],
      ),
    );
  }
}
