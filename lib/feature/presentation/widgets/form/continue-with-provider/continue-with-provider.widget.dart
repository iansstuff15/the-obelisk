import 'package:flutter/material.dart';
import 'package:the_obelisk/config/sizes.config.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/elevated-button.widget.dart';

class ContinueWithProvider extends StatelessWidget {
  const ContinueWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: AppSizes.extraSmall,
        ),
        const Text("or continue with"),
        SizedBox(
          height: AppSizes.extraSmall,
        ),
        AppElevatedButton(
          onPressed: () {},
          block: true,
          child: const Text("Google"),
        ),
      ],
    );
  }
}
