import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:effective_cart/src/app.dart';

void main() {
  runZonedGuarded(
    () => runApp(const EffectiveCartApp()),
    (error, stack) {
      log(error.toString(),
          name: 'Effective Cart App Error', stackTrace: stack);
    },
  );
}
