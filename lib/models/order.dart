import 'package:agric/models/product.dart';
import 'package:agric/utils/enums/order.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime orderDate;
  final DateTime delivery;
  final OrderStatus status;

  Order({
    required this.id, required this.products, required this.orderDate, required this.delivery, required this.status
});
}