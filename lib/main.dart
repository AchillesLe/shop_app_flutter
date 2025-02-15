import 'package:flutter/material.dart';
import 'package:flutter_app_new/screens/cart_screen.dart';
import 'screens/product_overview_screen.dart';
import 'screens/product_detail.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './providers/cart.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MultiProvider(
			providers: [
				ChangeNotifierProvider.value(
					value: Products(),
				),
				ChangeNotifierProvider.value(
					value: Cart(),
				),
			],
			child: MaterialApp(
				title: 'Flutter Demo',
				theme: ThemeData(
					primarySwatch: Colors.purple,
					accentColor: Colors.deepOrange,
					fontFamily: 'Lato',
				),
				home: ProductOverviewScreen(),
				routes: {
					ProductDetailScreen.routeName : (ctx)=> ProductDetailScreen(),
					CartScreen.routeName : (ctx) => CartScreen()
				},
			),
		);
	}
}
