import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/config/sizes.config.dart';

class AppStepper extends StatefulWidget {
  int? currentStep;
  int? maxSteps;
  String? currentStepTitle;

  AppStepper({super.key, 
    required this.currentStep,
    required this.maxSteps,
    required this.currentStepTitle,
  });
  @override
  State<AppStepper> createState() => _AppStepperState();
}

class _AppStepperState extends State<AppStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: AppSizes.mediumSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Step ${widget.currentStep} of ${widget.maxSteps}"),
            Text(
              "${widget.currentStepTitle}",
              style: TextStyle(
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppSizes.mediumSmall),
            ),
            SizedBox(
              height: AppSizes.small,
            ),
            LinearProgressIndicator(
              value: widget.currentStep! / widget.maxSteps!,
              color: AppColors.primary,
            ),
          ],
        ));
  }
}
