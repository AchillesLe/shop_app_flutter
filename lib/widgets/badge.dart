import 'package:flutter/material.dart';

class Badge extends StatelessWidget{
	final Widget child;
	final String value;
	final Color color;

	const Badge({
		Key key,
		@required this.child,
		@required this.value,
		this.color
	}):super(key:key);

	@override
	Widget build(BuildContext context){
		return Stack(
			alignment: Alignment.center,
			children: <Widget>[
				child,
				Positioned(
					right: 8,
					left: 8,
					child: Container(
						padding: EdgeInsets.all(2.0),
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(10.0),
							color: color != null ? color : Theme.of(context).accentColor,
						),
						constraints: BoxConstraints(
							minHeight: 16,
							maxWidth: 16,
						),
						child: Text(
							value,
							textAlign: TextAlign.center,
							style: TextStyle(
								fontSize: 10
							),
						),
					),
				)
			],
		);
	}
}