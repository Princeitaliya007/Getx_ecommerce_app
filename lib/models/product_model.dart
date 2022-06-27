import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  final String image;
  final String name;
  final int price;
  final RxInt items;
  final RxBool isFav;
  final RxBool isAddCart;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.items,
    required this.isFav,
    required this.isAddCart,
  });
}
