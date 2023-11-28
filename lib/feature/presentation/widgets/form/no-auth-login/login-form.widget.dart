import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/config/sizes.config.dart';
import 'package:the_obelisk/core/util/snackbar.dart';
import 'package:the_obelisk/core/util/supabase.dart';
import 'package:the_obelisk/feature/presentation/page/application/home/home.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/forgot-password/forgot-pasword.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/register/register.page.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/text-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/input/formField.widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            labelText: "Email",
            placeholder: "juandelacruz@email.com",
            controller: email,
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
                    email: email.text, password: password.text),
              ).then((value) {
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
          Row(
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
