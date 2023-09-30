import 'package:agric/models/order.dart';
import 'package:agric/widgets/order_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = order.products.take(2).toList();
    final totalPrice = order.products
        .fold(0.00, (previousValue, element) => previousValue + element.price);

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.grey.shade200)),
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Order : ${order.id}",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${order.products.length} Items",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("\$${totalPrice.toStringAsFixed(2)}")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ...List.generate(
              product.length,
              (index) {
                return OrderProduct(
                  product: product[index],
                  order: order,
                );
              },
            ),
            if (order.products.length > 1)
              const SizedBox(
                height: 20,
              ),
            if (order.products.length > 1)
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                              itemCount: order.products.length,
                              padding: const EdgeInsets.all(14),
                              itemBuilder: (context, index){
                            final product = order.products[index];
                            return OrderProduct(order: order, product: product);
                          }),
                        );
                      });
                },
                icon: const Icon(IconlyBold.arrowRight),
                label: const Text("View All"),
              )
          ],
        ),
      ),
    );
  }
}
