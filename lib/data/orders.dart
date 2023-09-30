import 'package:agric/data/products.dart';
import 'package:agric/utils/enums/order.dart';

import '../models/order.dart';

List<Order> orders = [
  Order(
      id: "111",
      products: products.reversed.take(3).toList(),
      orderDate: DateTime.utc(2023, 1, 1),
      delivery: DateTime.utc(2023, 2, 2),
      status: OrderStatus.processing),
  Order(
      id: "112",
      products: products.reversed.take(2).toList(),
      orderDate: DateTime.utc(2023, 1, 1),
      delivery: DateTime.utc(2023, 2, 2),
      status: OrderStatus.processing),
  Order(
      id: "222",
      products: products.reversed.take(3).toList(),
      orderDate: DateTime.utc(2023, 1, 1),
      delivery: DateTime.utc(2023, 2, 2),
      status: OrderStatus.delivered),
  Order(
      id: "333",
      products: products.reversed.take(3).toList(),
      orderDate: DateTime.utc(2023, 1, 1),
      delivery: DateTime.utc(2023, 2, 2),
      status: OrderStatus.picking),
  Order(
      id: "444",
      products: products.reversed.take(3).toList(),
      orderDate: DateTime.utc(2023, 1, 1),
      delivery: DateTime.utc(2023, 2, 2),
      status: OrderStatus.shipping),
];
