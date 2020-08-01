import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upajVirasat/Screens/ShopScreens/core/providers/orders_provider.dart';
import 'package:upajVirasat/Screens/ShopScreens/view/widgets/order_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItemWidget(orderData.orders[i]),
      ),
    );
  }
}
