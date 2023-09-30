import 'package:agric/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.1,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
            color: Colors.grey.shade400,
            width: 0.2,
          )),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 120,
            alignment: Alignment.topRight,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              width: 30,
              height: 30,
              child: IconButton.filledTonal(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: () {},
                  icon: const Icon(IconlyLight.bookmark)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$${product.price}/",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: product.unit,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton.filled(
                        padding: EdgeInsets.zero,
                          onPressed: () {}, icon: const Icon(Icons.add)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
