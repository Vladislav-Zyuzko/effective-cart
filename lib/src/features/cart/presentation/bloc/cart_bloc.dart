import 'package:bloc/bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const IdleCartState(0)) {
    on<CartEvent>((event, emit) {
      return switch (event) {
        CartIncrementEvent() => _updateCart(emit, 1),
        CartDecrementEvent() => _updateCart(emit, -1),
      };
    });
  }

  void _updateCart(Emitter<CartState> emit, int value) async {
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
