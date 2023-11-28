import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/input/validator/validator.input.dart';

class AppTextFormField extends StatefulWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? labelText;
  bool? obsureText;
  String? placeholder;
  AppTextFormField(
      {super.key,
      required this.keyboardType,
      this.labelText,
      this.placeholder,
      this.obsureText = false,
      this.controller});
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    toogleObsureText() {
      setState(() {
        widget.obsureText = !widget.obsureText!;
      });
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.labelText != null
          ? Text(
              widget.labelText!,
              style: TextStyle(
                fontWeight: AppFontWeight.semibold,
              ),
            )
          : Container(),
      SizedBox(
        height: AppSizes.extraSmall,
      ),
      Container(
          decoration: BoxDecoration(
              color: AppColors.textBox,
              borderRadius: BorderRadius.circular(AppSizes.extraSmall)),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            onChanged: (value) => {
              setState(() {
                errorText =
                    validateInput(value: value, type: widget.keyboardType!);
              })
            },
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: widget.placeholder,
                suffixIcon: widget.labelText?.toLowerCase() == "password"
                    ? widget.obsureText!
                        ? GestureDetector(
                            onTap: toogleObsureText,
                            child: const Icon(Ionicons.eye))
                        : GestureDetector(
                            onTap: toogleObsureText,
                            child: const Icon(Ionicons.eye_off))
                    : null),
            obscureText: widget.obsureText!,
          )),
      errorText != null
          ? Column(
              children: [
                SizedBox(
                  height: AppSizes.extraSmall,
                ),
                Text(
                  errorText!,
                  style: TextStyle(color: AppColors.textErrorColor),
                )
              ],
            )
          : Container(),
      SizedBox(
        height: AppSizes.extraSmall,
      ),
    ]);
  }
}
