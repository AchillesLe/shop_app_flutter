import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../screens/product_detail.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
class ProductItem extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>( context );
    final cart = Provider.of<Cart>( context );
    return ClipRRect(
		borderRadius: BorderRadius.circular(10),
		child: GridTile(
			child: GestureDetector( 
				onTap:(){ Navigator.of(context).pushNamed( ProductDetailScreen.routeName , arguments : product.id );  },
				child: Image.network(
					product.imageUrl , 
					fit: BoxFit.cover 
				)
        	),
      	footer: GridTileBar(
			backgroundColor: Colors.black54,
			leading:  Consumer<Product>(
				builder: ( ctx , product , child ) => IconButton(
							icon: Icon(
								product.isFavorite ? Icons.favorite : Icons.favorite_border
							),
							onPressed: (){ product.toggleFavoriteStatus(); },
							color: Theme.of(context).accentColor,
				),
				child: Text('Never change !'),
			),
			title: Text(
				product.title,
				textAlign: TextAlign.center,
			),
			trailing: IconButton(
				icon: Icon(Icons.shopping_cart),
				color: Theme.of(context).accentColor,
				onPressed: (){ 
					cart.addItem(product.id, product.price, product.title);
				},
			),
        ),
      ),
    );
  }
}