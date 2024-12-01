import 'dart:ui';

enum Angle { left, right }

class NewsCategory {
  Angle angel;
  String label;
  String image;
  Color color;

  NewsCategory({
    required this.label,
    required this.image,
    required this.color,
    required this.angel,
  });
}
