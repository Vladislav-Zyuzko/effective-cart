import 'package:effective_cart/src/features/cart/presentation/cart_screen.dart';
import 'package:flutter/material.dart';

class EffectiveCartApp extends StatelessWidget {
  const EffectiveCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartHolder(),
    );
  }
}
