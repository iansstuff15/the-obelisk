import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/config/sizes.config.dart';
import 'package:the_obelisk/core/util/supabase.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/widgets/bloc-builder/article/article-bloc-builder.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/auth-login/login-form.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';

class AuthLoginPage extends StatelessWidget {
  static String id = "Auth Login";
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: true,
      enableBottomNav: false,
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
                  "Welcome back",
                  style: GoogleFonts.besley(
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppSizes.medium),
                ),
                const AuthLoginForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}
