import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;

  const Badge({Key key, this.child, this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color == null ? Theme.of(context).accentColor : color),
            constraints: BoxConstraints(maxHeight: 16, maxWidth: 16),
            padding: EdgeInsets.all(2),
            child: Text(
              value,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
