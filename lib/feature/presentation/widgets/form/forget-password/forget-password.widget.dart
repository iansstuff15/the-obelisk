import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:the_obelisk/config/routes/router.config.dart';
import 'package:the_obelisk/config/sizes.config.dart';
import 'package:the_obelisk/core/util/snackbar.dart';
import 'package:the_obelisk/core/util/supabase.dart';
import 'package:the_obelisk/feature/presentation/page/application/home/home.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/no-auth-login/no-auth-login.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/register/register.page.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/text-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/input/formField.widget.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            labelText: "Email",
            controller: email,
          ),
          SizedBox(
            height: AppSizes.extraSmall,
          ),
          AppElevatedButton(
            onPressed: () {
              showFutureLoadingDialog(
                  context: context,
                  future: () => SupabaseUtil.sendResetPassword(
                        email: email.text,
                      )).then((value) {
                if (value.result == "success") {
                  AppSnackBar.showDefault(
                      context: context, message: value.result.toString());
                  AppRouter.replace(
                      context: context, route: NoAuthLoginPage.id);
                } else {
                  AppSnackBar.showError(
                      context: context, message: value.result.toString());
                }
              });
            },
            isPrimary: true,
            block: true,
            child: const Text("Send Verification"),
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
