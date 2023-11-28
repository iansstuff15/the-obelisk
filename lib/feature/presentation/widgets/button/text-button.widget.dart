import 'package:flutter/material.dart';

class AppTextButton extends TextButton {
  bool? block;
  AppTextButton(
      {super.key, super.onPressed, required super.child, this.block = false});

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.block! ? double.infinity : null,
      child: TextButton(
        onPressed: widget.onPressed,
        child: widget.child!,
      ),
    );
  }
}
