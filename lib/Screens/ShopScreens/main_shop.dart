import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upajVirasat/Screens/ShopScreens/core/providers/orders_provider.dart';
import 'package:upajVirasat/Screens/ShopScreens/utils/view/theme_manager.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/widgets/bottom_app_bar.dart';

import 'utils/view/constant_routs.dart';
import 'utils/view/router.dart';
import 'core/providers/cart_provider.dart';
import 'core/providers/products_provider.dart';


class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // We can listen to these providers to any part of application
        // These providers Container not cause rebuild but the listeners
        ChangeNotifierProvider.value(value: ProductsProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: OrdersProvider()),
//        ChangeNotifierProvider.value(value: ProductModelProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        initialRoute: productsOverviewRoute,
        title: ThemeManager.appName,
        theme: ThemeManager.lightTheme,
        home: SharedBottomAppBar(),
      ),
    );
  }
}
