import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/config/sizes.config.dart';
import 'package:the_obelisk/feature/data/enum/news-component-types.dart';
import 'package:the_obelisk/feature/presentation/widgets/bloc-builder/article/article-bloc-builder.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/register/register.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';
import 'package:the_obelisk/feature/presentation/widgets/stepper/stepper.widget.dart';

class RegisterPage extends StatefulWidget {
  static String id = "Register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Map<int, String> steps = {
    0: "Personal Information",
    1: "Account Credentials"
  };
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: true,
      enableBottomNav: false,
      child: Column(
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
                  "Register",
                  style: GoogleFonts.besley(
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppSizes.medium),
                ),
                SizedBox(
                  height: AppSizes.small,
                ),
                AppStepper(
                  currentStep: currentStep + 1,
                  maxSteps: steps.length,
                  currentStepTitle: steps[currentStep],
                ),
                RegisterForm(
                  currentStep: currentStep,
                  steps: steps.length,
                  onContinue: () {
                    setState(() {
                      currentStep = currentStep + 1;
                    });
                  },
                  onPrevious: () {
                    setState(() {
                      currentStep = currentStep - 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
