import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text(
          'Your cart is empty',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add items to the cart
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}