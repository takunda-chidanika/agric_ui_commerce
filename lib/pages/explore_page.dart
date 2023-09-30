import 'package:agric/data/products.dart';
import 'package:agric/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //   Filter and Search Field
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search here...",
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(99),
                            )),
                        prefixIcon: const Icon(IconlyLight.search)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton.filled(
                      onPressed: () {}, icon: const Icon(IconlyLight.filter)),
                )
              ],
            ),
          ),
          //Consultation Card
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: SizedBox(
              height: 170,
              child: Card(
                  color: Colors.green.shade50,
                  elevation: 0.1,
                  shadowColor: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        //Text
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Free Consultation",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.green.shade700,
                                    ),
                              ),
                              const Text(
                                  "Get Free support from our customer services"),
                              FilledButton(
                                onPressed: () {},
                                child: const Text("Call Now"),
                              ),
                            ],
                          ),
                        ),
                        //Image
                        Image.asset(
                          'assets/contact-us.jpg',
                          width: 140,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          //Featured Product
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(onPressed: () {}, child: const Text("see all"))
            ],
          ),
          // Featured Products
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
