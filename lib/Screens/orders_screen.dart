import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Widgets/app_drawer.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/Widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
        title: Text('Your orders'),
    ),
    drawer: AppDrawer(),
    body: ListView.builder(itemCount: orderdata.orders.length,itemBuilder: (ctx , i) => OrderItem(orderdata.orders[i
    ]
    )
    ),
    );
  }
}
