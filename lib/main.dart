import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:effective_cart/src/common/bloc/cart_observer.dart';
import 'package:flutter/material.dart';
import 'package:effective_cart/src/app.dart';

void main() {
  runZonedGuarded(
    () {
      Bloc.observer = CartObserver();
      runApp(const EffectiveCartApp());
    },
    (error, stack) {
      log(
        error.toString(),
        name: 'Effective Cart App Error',
        stackTrace: stack,
      );
    },
  );
}
