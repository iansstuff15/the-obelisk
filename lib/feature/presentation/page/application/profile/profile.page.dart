import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/core/util/snackbar.dart';
import 'package:the_obelisk/core/util/supabase.dart';
import 'package:the_obelisk/feature/presentation/page/auth/auth-login/auth-login.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/no-auth-login/no-auth-login.page.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';

class ProfilePage extends StatelessWidget {
  static String id = "Profile";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = supabase.auth.currentUser;
    return AppScaffold(
      showAppBar: true,
      showHamburgerMenu: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: GoogleFonts.besley(
                  fontWeight: AppFontWeight.bold, fontSize: AppSizes.medium),
            ),
            SizedBox(
              height: AppSizes.extraSmall,
            ),
            Text(
              "${user!.userMetadata!["lastName"]}, ${user!.userMetadata!["firstName"]}",
              style: TextStyle(
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppSizes.mediumSmall),
            ),
            Text(
              user!.email ?? "no email found",
              style: TextStyle(fontSize: AppSizes.small),
            ),
            SizedBox(
              height: AppSizes.small,
            ),
            AppElevatedButton(
              onPressed: () {
                showFutureLoadingDialog(
                    context: context,
                    future: () => SupabaseUtil.logOut()).then((value) {
                  AppSnackBar.showDefault(
                      context: context, message: value.result.toString());
                  AppRouter.replace(
                      context: context, route: NoAuthLoginPage.id);
                });
              },
              isPrimary: true,
              child: const Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
