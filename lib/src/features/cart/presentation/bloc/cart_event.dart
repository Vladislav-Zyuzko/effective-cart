part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

final class CartIncrementEvent extends CartEvent {
  const CartIncrementEvent();
}

final class CartDecrementEvent extends CartEvent {
  const CartDecrementEvent();
}
