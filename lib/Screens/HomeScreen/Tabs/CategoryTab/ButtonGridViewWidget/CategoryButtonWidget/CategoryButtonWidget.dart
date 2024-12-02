import 'package:flutter/material.dart';
import 'package:newsapp/Screens/NewsScreen/NewsScreen.dart';
import '../../../../../../DataClasses/Category.dart';


import 'ButtonDesign/ButtonDesign.dart';

class CategoryButtonWidget extends StatelessWidget {
  NewsCategory category;

  CategoryButtonWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,NewsScreen.routeName,arguments: category);
      },
      child: ButtonDesign(category: category),
    );
  }
}
