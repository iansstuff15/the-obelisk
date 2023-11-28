import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';

class AppIconButton extends StatefulWidget {
  bool? isPrimary;
  VoidCallback? onPressed;
  IconData? icon;
  double? size;
  AppIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.size,
      this.isPrimary = false});

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(
        widget.icon,
        size: widget.size != null ? widget.size : null,
      ),
      style: ButtonStyle(
          foregroundColor:
              widget.isPrimary! ? AppColors.primaryButtonTextColor : null,
          backgroundColor:
              widget.isPrimary! ? AppColors.primaryButtonColor : null),
    );
  }
}
