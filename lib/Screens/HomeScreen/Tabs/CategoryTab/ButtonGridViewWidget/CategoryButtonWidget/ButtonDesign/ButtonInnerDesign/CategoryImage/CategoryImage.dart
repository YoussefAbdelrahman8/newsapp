import 'package:flutter/material.dart';

class CategoryImage extends StatelessWidget {
  String image;

  CategoryImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$image",
      height: 120,
      width: 120,
    );
  }
}
