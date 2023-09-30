import 'package:agric/data/orders.dart';
import 'package:agric/utils/enums/order.dart';
import 'package:agric/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          bottom: TabBar(
              isScrollable: true,
              tabs: List.generate(tabs.length, (index) {
                return Tab(
                  text: tabs[index],
                );
              })),
        ),
        body: TabBarView(
          children: List.generate(
            tabs.length,
            (index) {
              final filtered = orders.where((order) => order.status == OrderStatus.values[index]).toList();
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final order = filtered[index];
                    return OrderItem(order: order,);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: filtered.length);
            },
          ),
        ),
      ),
    );
  }
}
