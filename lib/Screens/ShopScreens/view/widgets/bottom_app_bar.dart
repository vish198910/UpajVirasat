import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/screens/favourite_screen.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/screens/more_screen.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/screens/orders_screen.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/screens/products_overview_screen.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/shared/custom_bottomAppBar.dart';

class SharedBottomAppBar extends StatefulWidget {
  @override
  _SharedBottomAppBarState createState() => _SharedBottomAppBarState();
}

class _SharedBottomAppBarState extends State<SharedBottomAppBar> {
  Widget _lastSelected = ProductsOverviewScreen();

  String _title = 'Home';
  List<Widget> pages = [
    MoreScreen(),
    OrdersScreen(),
    FavouriteScreen(),
    ProductsOverviewScreen(),
  ];
  List<String> titles = ['More', 'My Orders', 'Favourite', 'Home'];

  void _selectedTab(int index) {
    setState(() {
      print(index);
      _lastSelected = pages[index];
      _title = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lastSelected,
      bottomNavigationBar: CustomBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.green,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          BottomAppBarItem(iconData: Icons.more_horiz, text: 'More'),
          BottomAppBarItem(iconData: Icons.card_travel, text: 'My Orders'),
          BottomAppBarItem(iconData: Icons.favorite, text: 'Favourite'),
          BottomAppBarItem(iconData: Icons.home, text: 'Home'),
        ],
      ),
    );
  }
}
