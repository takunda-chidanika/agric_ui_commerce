import 'dart:math';

import 'package:agric/models/product.dart';
import 'package:agric/pages/order_details_page.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';

class OrderProduct extends StatelessWidget {
  final Order order;
  final Product product;

  const OrderProduct({super.key, required this.order, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderDetailsPage(order: order)));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 90,
            margin: const EdgeInsets.only(right: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(product.image))),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  product.description,
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                    Text("Qty: ${Random().nextInt(4)+1}")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
