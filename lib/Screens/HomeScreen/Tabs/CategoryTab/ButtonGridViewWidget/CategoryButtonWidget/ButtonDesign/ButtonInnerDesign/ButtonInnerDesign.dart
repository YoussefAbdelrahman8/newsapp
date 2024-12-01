import 'package:flutter/material.dart';

import 'CategoryImage/CategoryImage.dart';

class ButtonInnerDesign extends StatelessWidget {
  String image;
  String label;

  ButtonInnerDesign({
    super.key,
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CategoryImage(image: image),
        SizedBox(
          height: height * 0.002,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
