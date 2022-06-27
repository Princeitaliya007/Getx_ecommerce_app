import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/providers/product_provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Page"),
      ),
      body: Obx(
        () => ListView(
          padding:
              const EdgeInsets.only(top: 10, bottom: 70, left: 10, right: 10),
          children: productController.favouriteItem
              .map(
                (e) => Card(
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Obx(
                            () => Icon(
                              productController
                                      .products[
                                          productController.products.indexOf(e)]
                                      .isAddCart
                                      .isTrue
                                  ? Icons.shopping_bag_rounded
                                  : Icons.shopping_bag_outlined,
                            ),
                          ),
                          onPressed: () {
                            productController.addProducts(e: e);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                          ),
                          onPressed: () {
                            productController.addFavourite(e: e);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
