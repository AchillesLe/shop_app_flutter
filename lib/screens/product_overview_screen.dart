import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../models/product.dart';
import '../screens/cart_screen.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
enum FilterOption{
  Favorites,
  All
}
class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
    var _showOnlyfavorite = false;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOption selectedValue){
                setState(() {
                  if(selectedValue == FilterOption.Favorites){
                    _showOnlyfavorite = true;
                  }else{
                    _showOnlyfavorite = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                PopupMenuItem(child: Text('Only Favorite'),value: FilterOption.Favorites),
                PopupMenuItem(child: Text('Show all'),value: FilterOption.All),
              ],
            ),
            Consumer<Cart>(
              builder: ( _ , cart , ch ) => Badge(
                child: ch,
                value:  cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],
        ),
        body: new ProductsGrid(_showOnlyfavorite),
        floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        ),
      );
    }
}

