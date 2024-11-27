part of 'cart_bloc.dart';

sealed class CartState {
  final int cartQuantity;

  const CartState(this.cartQuantity);
}

final class ProgressCartState extends CartState {
  const ProgressCartState(super.cartQuantity);
}

final class SuccessCartState extends CartState {
  const SuccessCartState(super.cartQuantity);
}

final class ErrorCartState extends CartState {
  const ErrorCartState(super.cartQuantity);
}

final class IdleCartState extends CartState {
  const IdleCartState(super.cartQuantity);
}
