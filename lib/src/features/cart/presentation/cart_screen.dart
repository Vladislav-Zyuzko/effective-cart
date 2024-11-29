import 'package:effective_cart/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:effective_cart/src/features/cart/presentation/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartHolder extends StatelessWidget {
  const CartHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: const _CartScreen(),
    );
  }
}

class _CartScreen extends StatelessWidget {
  const _CartScreen();

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.watch<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Effective BLoC Example'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CartButton(
              onPressed: () => cartBloc.add(const CartIncrementEvent()),
              icon: const Icon(Icons.add),
            ),
            SizedBox.square(
              dimension: 32,
              child: Center(
                child: BlocConsumer<CartBloc, CartState>(
                  listener: (context, state) => {
                    if (state is ErrorCartState && state.cartQuantity == 0)
                      _showSnackbar(context, 'Корзина пуста'),
                    if (state is ErrorCartState && state.cartQuantity == 10)
                      _showSnackbar(context, 'В корзине больше нет места')
                  },
                  buildWhen: (previous, current) => current is! IdleCartState,
                  builder: (context, state) {
                    if (state is ProgressCartState) {
                      return const CircularProgressIndicator();
                    }
                    return Text(
                      state.cartQuantity.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ),
            ),
            CartButton(
              onPressed: () => cartBloc.add(const CartDecrementEvent()),
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
