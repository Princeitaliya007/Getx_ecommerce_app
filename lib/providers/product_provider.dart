import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/models/product_model.dart';

class ProductController extends GetxController {
  List<Product> products = [
    Product(
        image: "https://cdn.mos.cms.futurecdn.net/6t8Zh249QiFmVnkQdCCtHK.jpg",
        name: "Laptop",
        price: 65000,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image:
            "https://www.nokia.com/shop/sites/default/files/styles/aspect_16_9_1200px/public/2020-12/2880X1620px-1_0.jpg?itok=dtn_TZqA",
        name: "AC",
        price: 28000,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image:
            "https://www.lg.com/in/images/washing-machines/md07540724/gallery/FHM1065SDL-Washing-Machines-Front-View-D-01.jpg",
        name: "Washing machine",
        price: 21000,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image:
            "https://5.imimg.com/data5/RO/RA/JE/SELLER-3866941/gaming-desktop-pc-500x500.jpg",
        name: "PC",
        price: 70000,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image:
            "https://www.lg.com/in/images/refrigerators/md07518272/gallery/GL-T432AESY-Refrigerators-Left-View-D-10.jpg",
        name: "Refrigerator",
        price: 29000,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image:
            "https://static.toiimg.com/thumb/msid-88352235,width-800,resizemode-4,imgsize-8398/share.jpg",
        name: "Smartphone",
        price: 41000,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image:
            "https://5.imimg.com/data5/DI/ZS/CP/SELLER-50489472/fortex-hd-ready-ips-led-tv-500x500.jpg",
        name: "TV",
        price: 20000,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image:
            "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80",
        name: "Shoes",
        price: 2500,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs),
    Product(
        image: "https://m.media-amazon.com/images/I/712wRLMlBeL._SX522_.jpg",
        name: "Smartwatch",
        price: 4100,
        items: 1.obs,
        isFav: false.obs,
        isAddCart: false.obs)
  ];

  RxList<Product> addToCart = <Product>[].obs;
  RxList<Product> favouriteItem = <Product>[].obs;
  RxDouble totalPrice = 0.0.obs;

  void totalPriceFinder() {
    totalPrice.value = 0;

    addToCart.forEach((e) {
      totalPrice.value += e.items * e.price;
    });
  }

  void addProducts({required Product e}) {
    if (products[products.indexOf(e)].isAddCart.isFalse) {
      products[products.indexOf(e)].isAddCart.value = true;

      addToCart.add(e);
    } else {
      addToCart[addToCart.indexOf(e)].items.value = 1;
      addToCart.remove(e);

      products[products.indexOf(e)].isAddCart.value = false;
    }
  }

  void addFavourite({required Product e}) {
    if (products[products.indexOf(e)].isFav.isFalse) {
      products[products.indexOf(e)].isFav.value = true;

      favouriteItem.add(e);
    } else {
      products[products.indexOf(e)].isFav.value = false;
      favouriteItem.remove(e);
    }
  }

  void quentityIncrement({required int index}) {
    addToCart[index].items.value++;
  }

  void quentityDecrement({required int index}) {
    if (addToCart[index].items.value > 1) {
      addToCart[index].items.value--;
    }
  }
}

class ThemeController extends GetxController {
  RxBool isDark = false.obs;

  void changeTheme() {
    isDark.value = !isDark.value;

    Get.changeThemeMode(isDark.isTrue ? ThemeMode.dark : ThemeMode.light);
  }
}
