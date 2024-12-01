import 'package:flutter/material.dart';
import 'package:newsapp/DataClasses/Category.dart';

import 'CategoryButtonWidget/CategoryButtonWidget.dart';

class ButtonGridViewWidget extends StatelessWidget {
  List<NewsCategory> categories;

  ButtonGridViewWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) => CategoryButtonWidget(
        category: categories[index],
      ),
    );
  }
}
