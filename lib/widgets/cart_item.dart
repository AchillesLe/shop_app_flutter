import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String id;
  final double price;
  final int quantity;
  final String title;
  CartItem(this.productId,this.id,this.price,this.quantity,this.title);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
          Provider.of<Cart>(context).removeItem(productId);
      },
      child: Card( 
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '\$${price} x',
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total : \$${ (price*quantity) }'),
            trailing: Text('$quantity x '),
          ),
        ),
      ),
    );
  }
}