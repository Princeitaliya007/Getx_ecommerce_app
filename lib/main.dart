import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopping_cart/providers/product_provider.dart';
import 'package:shopping_cart/views/cart_view.dart';
import 'package:shopping_cart/views/favourite_view.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffF5F8FE),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff76BA99),
          foregroundColor: Color(0xffffffff),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff76BA99),
          foregroundColor: Colors.white,
        ),
        cardColor: const Color(0xffffffff),
        textTheme: const TextTheme(
          button: TextStyle(
            color: Color(0xff1C2754),
          ),
          bodyText2: TextStyle(
            color: Color(0xff141D3C),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff141D3C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1c2754),
          foregroundColor: Color(0xffffffff),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff1c2754),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        cardColor: Color(0xff6B84F5),
      ),
      routes: {
        '/': (context) => const HomePage(),
        'cart_page': (context) => const CartPage(),
        'fav_page': (context) => const FavouritePage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.put(ProductController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        centerTitle: true,
        title: const Text(
          "Shopping cart",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.format_paint,
              color: Colors.white,
            ),
            onPressed: () {
              themeController.changeTheme();
            },
          ),
        ],
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 10, bottom: 90, left: 10, right: 10),
        children: productController.products
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
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
                        icon: Obx(
                          () => Icon(
                            productController
                                    .products[
                                        productController.products.indexOf(e)]
                                    .isFav
                                    .isFalse
                                ? Icons.favorite_border_rounded
                                : Icons.favorite,
                          ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
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
        height: 60,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                Get.toNamed('fav_page');
              },
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {
                Get.toNamed('cart_page');
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
