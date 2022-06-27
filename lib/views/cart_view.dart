import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/providers/product_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    productController.totalPriceFinder();
  }

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('pdf_page');
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: Obx(
              () => ListView(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 70, left: 10, right: 10),
                children: productController.addToCart
                    .map((e) => Card(
                          elevation: 3,
                          child: ListTile(
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(e.image),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            title: Text(e.name),
                            subtitle: Text("${e.price}"),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: () {
                                    productController.quentityIncrement(
                                        index: productController.addToCart
                                            .indexOf(e));
                                    productController.totalPriceFinder();
                                  },
                                  child: const Icon(Icons.add),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Obx(
                                  () => Text(
                                    "${e.items.value}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: () {
                                    productController.quentityDecrement(
                                        index: productController.addToCart
                                            .indexOf(e));
                                    productController.totalPriceFinder();
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                IconButton(
                                  onPressed: () {
                                    productController.addProducts(e: e);
                                    productController.totalPriceFinder();
                                  },
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 0),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => Text(
                "Total Products: ${productController.addToCart.length}",
                style: TextStyle(
                  color: Theme.of(context)
                      .floatingActionButtonTheme
                      .foregroundColor,
                  fontSize: 18,
                ),
              ),
            ),
            Obx(
              () => Text(
                "Total Price: ${productController.totalPrice.value}",
                style: TextStyle(
                  color: Theme.of(context)
                      .floatingActionButtonTheme
                      .foregroundColor,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
