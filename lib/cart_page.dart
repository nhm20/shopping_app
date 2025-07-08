import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            ),
            trailing: IconButton(
              
              onPressed: () {
               showDialog(context: context, 
               barrierDismissible: false,
               builder:(context){
                 return AlertDialog(
                   content: Text('Are you sure you want to remove ${cartItem['title']} from the cart?'),
                   actions: [
                     TextButton(
                       onPressed: () {
                         Navigator.of(context).pop();
                       },
                       child: Text('Cancel'),
                     ),
                     TextButton(
                       onPressed: () {
                         Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             content: Text('${cartItem['title']} removed from cart'),
                             duration: const Duration(seconds: 2),
                           ),
                         );
                         Navigator.of(context).pop();
                       },
                       child: Text('Remove'),
                     ),
                   ],
                 );
               });
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
            title: Text(cartItem['title'] as String),
            subtitle: Text('Size: ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
