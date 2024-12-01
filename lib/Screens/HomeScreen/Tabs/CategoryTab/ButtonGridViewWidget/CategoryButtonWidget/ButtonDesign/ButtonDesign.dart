import 'package:flutter/material.dart';

import '../../../../../../../DataClasses/Category.dart';

import 'ButtonInnerDesign/ButtonInnerDesign.dart';

class ButtonDesign extends StatelessWidget {
  NewsCategory category;

  ButtonDesign({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    double rightValue = 0;
    double leftValue = 0;
    category.angel == Angle.left ? rightValue = 25 : leftValue = 25;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.005,
      ),
      width: 148,
      height: 171,
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(rightValue),
          bottomLeft: Radius.circular(leftValue),
          topRight: const Radius.circular(25),
          topLeft: const Radius.circular(25),
        ),
      ),
      child: Center(
        child: ButtonInnerDesign(
          label: category.label,
          image: category.image,
        ),
      ),
    );
  }
}
