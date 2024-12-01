import 'package:flutter/material.dart';

import '../../../../DataClasses/Category.dart';
import 'ButtonGridViewWidget/ButtonGridViewWidget.dart';

class CategoryTab extends StatelessWidget {
  static const id = 0;
  List<NewsCategory> categories = [
    NewsCategory(
      label: "Sports",
      image: "sports.png",
      color: const Color(0xFFC91C22),
      angel: Angle.right,
    ),
    NewsCategory(
      label: "Politics",
      image: "Politics.png",
      color: const Color(0xFF003E90),
      angel: Angle.left,
    ),
    NewsCategory(
      label: "Health",
      image: "health.png",
      color: const Color(0xFFED1E79),
      angel: Angle.right,
    ),
    NewsCategory(
      label: "Business",
      image: "bussines.png",
      color: const Color(0xFFCF7E48),
      angel: Angle.left,
    ),
    NewsCategory(
      label: "Environment",
      image: "environment.png",
      color: const Color(0xFF4882CF),
      angel: Angle.right,
    ),
    NewsCategory(
      label: "Science",
      image: "science.png",
      color: const Color(0xFFF2D352),
      angel: Angle.left,
    )
  ];

  CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.06),
            child: Text(
              "Pick your category\nof interest",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: ButtonGridViewWidget(categories: categories),
          )
        ],
      ),
    );
  }
}
