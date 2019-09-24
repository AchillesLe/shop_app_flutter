import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget{
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context){
    final cart = Provider.of<Cart>(context); 
    final items = cart.items.values.toList(); 
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  label: Text('\$${cart.totalAmount}'),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  child: Text('ORDER NOW'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: (){

                  },
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx,i) =>
                ci.CartItem( 
                  cart.items.keys.toList()[i],
                  items[i].id ,
                  items[i].price , 
                  items[i].quantity, 
                  items[i].title)
            ,
          ),
        )
      ],),
    );
  }
}