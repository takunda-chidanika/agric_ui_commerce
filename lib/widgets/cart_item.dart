import 'dart:async';

import 'package:agric/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartItem extends StatelessWidget {
  final Product cartItem;

  const CartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: const Icon(IconlyLight.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        final completer = Completer<bool>();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            content: const Text("Remove from cart?"),
            action: SnackBarAction(label: "keep", onPressed: () {
                completer.complete(false);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
          ),
        );
        Timer(const Duration(seconds: 3),(){
          if(!completer.isCompleted){
            completer.complete(true);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        });
        return await completer.future;
      },
      child: SizedBox(
        height: 125,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.2,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 0.2, color: Colors.grey.shade400)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                //Image
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 90,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(cartItem.image))),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        cartItem.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${cartItem.price}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(
                            height: 30,
                            child: ToggleButtons(
                                onPressed: (index) {
                                  if (index == 0) {
                                  } else if (index == 2) {}
                                },
                                borderRadius: BorderRadius.circular(99),
                                isSelected: const [true, false, true],
                                selectedColor:
                                    Theme.of(context).colorScheme.primary,
                                constraints: const BoxConstraints(
                                    minHeight: 30, minWidth: 30),
                                children: const [
                                  Icon(
                                    Icons.remove,
                                    size: 20,
                                  ),
                                  Text("2"),
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                  )
                                ]),
                          )
                        ],
                      ),
                    ],
                  ),
                )
                //details
              ],
            ),
          ),
        ),
      ),
    );
  }
}
