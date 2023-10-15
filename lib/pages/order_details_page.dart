import 'package:agric/models/order.dart';
import 'package:agric/utils/enums/order.dart';
import 'package:agric/utils/extensions/date.dart';
import 'package:agric/widgets/order_item.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    const steps = OrderStatus.values;
    final activeStep = steps.indexOf(order.status);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          EasyStepper(
            activeStep:
                activeStep == steps.length - 1 ? activeStep + 1 : activeStep,
            stepRadius: 8,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Theme.of(context).colorScheme.primary,
            lineStyle: LineStyle(
              defaultLineColor: Colors.green.shade300,
              lineLength:
                  (MediaQuery.of(context).size.width * 0.70) / steps.length,
            ),
            steps: List.generate(
              steps.length,
              (index) {
                return EasyStep(
                  icon: const Icon(Icons.local_shipping),
                  finishIcon: const Icon(Icons.done),
                  title: steps[index].name,
                  topTitle: true,
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: Colors.grey.shade200,
                )),
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order ${order.id}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Chip(
                          label: Text(steps[activeStep].name),
                          shape: const StadiumBorder(),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.4),
                          side: BorderSide.none,
                          labelPadding: EdgeInsets.zero,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          avatar: const Icon(Icons.fire_truck),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Delivery Estimate"),
                      Text(
                        order.delivery.dateFormatter,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "TJ Chidanika",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Icon(
                        IconlyLight.home,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Harare Zimbabwe"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Icon(
                        IconlyLight.call,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("+263 77 144 7300"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Method"),
                      Text(
                        "Credit Card *****0000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          OrderItem(order: order, visibleProducts: 1,)
        ],
      ),
    );
  }
}
