import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Column(
    children: <Widget>[
      Text(
        'Deliver features faster',
        textDirection: TextDirection.ltr,
      ),
      Text('Craft beautiful UIs', textDirection: TextDirection.ltr),
      Column(children: <Widget>[
        Text('Make art as a you can', textDirection: TextDirection.ltr)
      ]),
      Expanded(
        child: FittedBox(
          child: FlutterLogo(),
        ),
      ),
    ],
  ));
}
