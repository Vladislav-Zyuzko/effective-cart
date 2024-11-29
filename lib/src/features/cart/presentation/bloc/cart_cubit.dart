import 'package:bloc/bloc.dart';
import 'package:effective_cart/src/features/cart/presentation/bloc/cart_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const IdleCartState(0));

  void increment() => _updateCart(1);

  void decrement() => _updateCart(-1);

  void _updateCart(int value) async {
    emit(ProgressCartState(state.cartQuantity));
    await Future.delayed(const Duration(milliseconds: 300));

    final newValue = state.cartQuantity + value;
    if (newValue > 10 || newValue < 0) {
      emit(ErrorCartState(state.cartQuantity));
    } else {
      emit(SuccessCartState(state.cartQuantity + value));
    }
    emit(IdleCartState(state.cartQuantity));
  }
}
