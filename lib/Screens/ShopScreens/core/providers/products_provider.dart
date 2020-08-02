import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/ShopScreens/core/providers/product_model_provider.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModelProvider> _products = [
    ProductModelProvider(
      id: 'p1',
      title: 'Corn',
      description: 'Corn Seeds',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/09/26/21/24/sweet-corn-3705687_1280.jpg',
    ),
    ProductModelProvider(
        id: 'p2',
        title: 'Wheat',
        description: 'Wheat Seeds',
        price: 59.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2011/08/17/12/31/spike-8743_1280.jpg'),
    ProductModelProvider(
      id: 'p3',
      title: 'Gardenia',
      description: 'Vermi Compost',
      price: 19.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71MJYU0LYML._SL1200_.jpg',
    ),
    ProductModelProvider(
      id: 'p4',
      title: 'Spray Hose Watering Pipe',
      description: 'NEPTUNE SIMPLIFY FARMING 5 Layers High Pressure Spray Hose Watering Pipe (100 m, Orange)',
      price: 49.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/817t9qfGjqL._SL1500_.jpg',
    ),
    /* ProductModelProvider(
        id: 'p5',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://webcomicms.net/sites/default/files/clipart/170435/clothes-png-transparent-images-170435-4237336.png'),
    ProductModelProvider(
        id: 'p6',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://toppng.com/uploads/preview/1st-in-firefighter-bear-pocket-t-black-firefighter-what-teddy-bear-clothes-fits-most-115690366871syjjukhtr.png'),
 */  ];

  // getter
  //  List<Product> get products => [..._products];
  List<ProductModelProvider> get products {
    return _products;
  }

  List<ProductModelProvider> get favoriteProducts {
    return _products.where((product) => product.isFavorite).toList();
  }

  Future<void> addProduct(ProductModelProvider product) {
    const String url =
        "https://flutter-shop-7ddca.firebaseio.com/products.json";
    return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'imageUrl': product.imageUrl,
              'price': product.price,
              'isFavorite': product.isFavorite,
            }))
        .then((response) {
      _products.add(product);
      notifyListeners();
    }).catchError((err) {
      // Print Something ...
    });
  }

  void updateProduct(String id, ProductModelProvider product) {
    final productIndex = _products.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      _products[productIndex] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  ProductModelProvider findProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  void addProductToFavourite(String id) {
    final product = _products.firstWhere((product) => product.id == id);
    if (product.isFavorite == false) {
      product.isFavorite = true;
      notifyListeners();
    }
  }

  void removeProductFromFavourite(String id) {
    final product = _products.firstWhere((product) => product.id == id);
    if (product.isFavorite) {
      product.isFavorite = false;
      notifyListeners();
    }
  }
}
