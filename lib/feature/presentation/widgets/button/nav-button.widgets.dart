import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  bool? isPrimary;
  VoidCallback? onPressed;
  IconData? icon;
  String? id;
  NavButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(
        widget.icon,
        color: Colors.white,
      ),
    );
  }
}
