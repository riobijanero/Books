import 'package:flutter/material.dart';

const TextStyle articleTitleStyle =
    TextStyle(fontSize: 20, color: Colors.black);
const TextStyle articleSubstitlteStyle =
    TextStyle(fontSize: 16, color: Colors.black);
const double searchBarHeight = 50;
final BoxDecoration detailedWidgetDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(20)),
  border: Border.all(color: Colors.grey, width: .5),
  boxShadow: [
    BoxShadow(
      color: Colors.grey[400],
      blurRadius: 3,
      offset: Offset(1, 1),
    )
  ],
);

const ShapeBorder listTileShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
  side: BorderSide(width: .5, color: Colors.grey),
);

final BorderRadiusGeometry fotoBorderRadius = BorderRadius.circular(10);
