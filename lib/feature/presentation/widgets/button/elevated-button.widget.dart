import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';

class AppElevatedButton extends ElevatedButton {
  bool? isPrimary;
  bool? block;
  AppElevatedButton(
      {super.key,
      required super.onPressed,
      required super.child,
      this.isPrimary = false,
      this.block = false});

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.block! ? double.infinity : null,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
              foregroundColor:
                  widget.isPrimary! ? AppColors.primaryButtonTextColor : null,
              backgroundColor:
                  widget.isPrimary! ? AppColors.primaryButtonColor : null),
          child: widget.child,
        ));
  }
}
