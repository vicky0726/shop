import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/Widgets/cart_item.dart';
import 'package:shop_app/providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        // color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart: cart),
                  // FlatButton(
                  //   child: Text('ORDER NOW'),
                  //   onPressed: () {
                  //     Provider.of<Orders>(context, listen: false).addOrder(
                  //       cart.items.values.toList(),
                  //       cart.totalAmount,
                  //     );
                  //     cart.clear();
                  //   },
                  //   textColor: Theme.of(context).primaryColor,
                  // )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItems(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}


class OrderButton extends StatefulWidget {
  const OrderButton({Key? key, required this.cart}) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('ORDER NOW'),
      onPressed: () async {

        await Provider.of<Orders>(context, listen: false).addOrder(
            widget.cart.items.values.toList(), widget.cart.totalAmount);
        // setState(() {
        //   widget.cart.totalAmount = 0;
        // });
        widget.cart.clearCart();
      },
    );
  }
}