import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';
import 'package:the_obelisk/config/sizes.config.dart';
import 'package:the_obelisk/core/util/biometrics.dart';
import 'package:the_obelisk/core/util/snackbar.dart';
import 'package:the_obelisk/core/util/supabase.dart';
import 'package:the_obelisk/feature/presentation/page/application/home/home.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/forgot-password/forgot-pasword.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/no-auth-login/no-auth-login.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/register/register.page.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/icon_button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/text-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/input/formField.widget.dart';

class AuthLoginForm extends StatelessWidget {
  const AuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final User? user = supabase.auth.currentUser;
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSizes.getWitdth(context),
            height: AppSizes.large,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(vertical: AppSizes.tweenSmall),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.extraSmall),
                color: AppColors.primary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user!.userMetadata!["lastName"]}, ${user!.userMetadata!["firstName"]}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.small),
                ),
                Text(
                  user!.email ?? "no email found",
                  style: TextStyle(
                      color: Colors.white, fontSize: AppSizes.tweenSmall),
                )
              ],
            ),
          ),
          AppTextFormField(
            keyboardType: TextInputType.visiblePassword,
            labelText: "Password",
            obsureText: true,
            controller: password,
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          Row(
            children: [
              const Text("Forgot password?"),
              AppTextButton(
                child: const Text("Reset Password"),
                onPressed: () {
                  AppRouter.push(
                      context: context, route: ForgotPasswordPage.id);
                },
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          AppElevatedButton(
            onPressed: () {
              showFutureLoadingDialog(
                  context: context,
                  future: () => SupabaseUtil.loginUser(
                      email: user.email!,
                      password: password.text)).then((value) {
                if (value.result == "success") {
                  AppSnackBar.showDefault(
                      context: context, message: value.result.toString());
                  AppRouter.replace(context: context, route: HomePage.id);
                } else {
                  AppSnackBar.showError(
                      context: context, message: value.result.toString());
                }
              });
            },
            isPrimary: true,
            block: true,
            child: const Text("Login"),
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          Center(
            child: Text("or login with"),
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          Center(
            child: AppIconButton(
              onPressed: () async {
                if (await AppBiometrics().authenticate()) {
                  AppRouter.replace(context: context, route: HomePage.id);
                }
              },
              icon: Icons.fingerprint,
              size: AppSizes.large,
            ),
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          AppTextButton(
            onPressed: () {
              showFutureLoadingDialog(
                      context: context, future: () => SupabaseUtil.logOut())
                  .then((value) => AppRouter.replace(
                      context: context, route: NoAuthLoginPage.id));
            },
            block: true,
            child: const Text("Log out"),
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account yet?"),
              AppTextButton(
                child: const Text("Register"),
                onPressed: () {
                  AppRouter.push(context: context, route: RegisterPage.id);
                },
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
        ],
      ),
    );
  }
}
