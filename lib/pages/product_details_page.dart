import 'package:agric/data/products.dart';
import 'package:agric/models/product.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showMore = false;

  late TapGestureRecognizer readMoreGestureRecognizer;

  @override
  void initState() {
    readMoreGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMore = !showMore;
        });
      };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconlyBroken.bookmark))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 250,
            margin: const EdgeInsets.only(bottom: 16),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(widget.product.image),
                  fit: BoxFit.cover,
                )),
          ),
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available in stock",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$${widget.product.price}/",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextSpan(
                    text: widget.product.unit,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade600,
              ),
              Text("${widget.product.rating}(193)"),
              const Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.remove)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "5 ${widget.product.unit}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.add)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                    text: showMore
                        ? widget.product.description
                        : '${widget.product.description.substring(0, widget.product.description.length - 200)}...'),
                TextSpan(
                  recognizer: readMoreGestureRecognizer,
                  text: showMore ? "Read Less" : "Read More",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Related Products",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 90,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(products[index].image),
                          fit: BoxFit.cover,
                        )),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: products.length),
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.icon(
            onPressed: () {},
            label: const Text("Add To Cart"),
            icon: const Icon(IconlyLight.bag),
          )
        ],
      ),
    );
  }
}
