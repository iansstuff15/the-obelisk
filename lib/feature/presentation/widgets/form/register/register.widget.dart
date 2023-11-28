import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/core/util/snackbar.dart';
import 'package:the_obelisk/core/util/supabase.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/input/formField.widget.dart';

class RegisterForm extends StatefulWidget {
  int? currentStep;
  int? steps;
  VoidCallback? onContinue;
  VoidCallback? onPrevious;
  RegisterForm(
      {super.key,
      required this.currentStep,
      required this.steps,
      required this.onContinue,
      required this.onPrevious});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            child: widget.currentStep == 0
                ? Column(
                    children: [
                      AppTextFormField(
                        keyboardType: TextInputType.name,
                        labelText: "First Name",
                        placeholder: "Juan",
                        controller: firstName,
                      ),
                      AppTextFormField(
                        keyboardType: TextInputType.name,
                        labelText: "Last Name",
                        placeholder: "Dela cruz",
                        controller: lastName,
                      ),
                    ],
                  )
                : Container(),
          ),
          Container(
            child: widget.currentStep == 1
                ? Column(
                    children: [
                      AppTextFormField(
                        keyboardType: TextInputType.name,
                        labelText: "Email",
                        placeholder: "juandelacruz@email.com",
                        controller: email,
                      ),
                      AppTextFormField(
                        keyboardType: TextInputType.name,
                        labelText: "Password",
                        controller: password,
                      ),
                    ],
                  )
                : Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.currentStep != 0
                  ? AppElevatedButton(
                      onPressed: () {
                        if (widget.currentStep != 0) {
                          widget.onPrevious!();
                        }
                      },
                      child: const Text("Previous"),
                    )
                  : const SizedBox(),
              SizedBox(
                width: AppSizes.small,
              ),
              AppElevatedButton(
                onPressed: () {
                  if (widget.currentStep! < (widget.steps! - 1)) {
                    widget.onContinue!();
                  } else {
                    showFutureLoadingDialog(
                        context: context,
                        future: () => SupabaseUtil.createUser(
                            email: email.text,
                            password: password.text,
                            firstName: firstName.text,
                            lastName: lastName.text)).then((value) {
                      if (value.result == "success") {
                        AppSnackBar.showDefault(
                            context: context, message: value.result.toString());
                      } else {
                        AppSnackBar.showError(
                            context: context, message: value.result.toString());
                      }
                    });
                  }
                },
                isPrimary: true,
                child: const Text("Continue"),
              ),
              SizedBox(
                width: AppSizes.small,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
