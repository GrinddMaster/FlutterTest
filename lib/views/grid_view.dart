import 'package:flutter/material.dart';

Widget gridItems() {
  return GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
    ),
    scrollDirection: Axis.horizontal,
    children: [
      Image.network('https://picsum.photos/250?image=1'),
      Image.network('https://picsum.photos/250?image=2'),
      Image.network('https://picsum.photos/250?image=3'),
      Image.network('https://picsum.photos/250?image=4'),
    ],
  );
}
