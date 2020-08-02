import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upajVirasat/Screens/ShopScreens/core/providers/products_provider.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/widgets/poroduct_grid_item.dart';

class ProductsGrid extends StatelessWidget {
  final showFavorites;
  ProductsGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    // listen to ProductsProvider to get all products list
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showFavorites ? productsData.favoriteProducts : productsData.products;
    return GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(6.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in row
          childAspectRatio: 0.75,
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 15, // Space between rows
        ),
        itemBuilder: (context, index) {
          // Listen to specific object
          return ChangeNotifierProvider.value(
            value: products[index],
            child: ProductGridItem(index),
          );
        });
  }
}
