import 'package:agric/data/products.dart';
import 'package:agric/widgets/cart_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = products.take(4).toList();
    final totalPrice = cartItems.map((e) => e.price).reduce((value,
        element) => value + element);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //LIST OF ITEMS
          ...List.generate(cartItems.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CartItem(cartItem: cartItems[index],),
            );
          }),
          const SizedBox(height: 15,),
          //TOTAL OF IN CART
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total (${cartItems.length})"),
              Text("\$$totalPrice", style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary
              ),),
            ],
          ),
          const SizedBox(height: 20,),
          // CHECK OUT BUTTON
          FilledButton.icon(onPressed: (){}, label: const Text("Proceed to checkout"), icon: const Icon(IconlyBold.arrowRight),)
        ],
      ),
    );
  }
}
