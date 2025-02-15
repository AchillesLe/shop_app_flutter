import 'package:flutter/material.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
class ProductsGrid extends StatelessWidget {
  final bool _showFavs;
  ProductsGrid(this._showFavs);
	@override
	Widget build(BuildContext context) {
		final productsData = Provider.of<Products>(context);
		final products = _showFavs == false ? productsData.items : productsData.favoriteItem;
		return GridView.builder(
			padding: const EdgeInsets.all(10.0),
			itemCount: products.length,
			itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
				value: products[i],
				child: ProductItem(),
			),
			gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2,crossAxisSpacing: 10,mainAxisSpacing: 10),
		);
	}
}