import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;

  const CartButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFFd8bcfc),
      ),
      child: icon,
    );
  }
}
