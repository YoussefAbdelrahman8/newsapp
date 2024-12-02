import 'package:flutter/material.dart';
import 'package:newsapp/Provider/SettingsProvider.dart';

import '../../../../DataClasses/Category.dart';
import 'ButtonGridViewWidget/ButtonGridViewWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryTab extends StatelessWidget {
  static const id = 0;


  CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<NewsCategory> categories = [
      NewsCategory(
        label: AppLocalizations.of(context)!.sports,
        image: "sports.png",
        color: const Color(0xFFC91C22),
        angel: Angle.right,
      ),
      NewsCategory(
        label: AppLocalizations.of(context)!.politics,
        image: "Politics.png",
        color: const Color(0xFF003E90),
        angel: Angle.left,
      ),
      NewsCategory(
        label: AppLocalizations.of(context)!.health,
        image: "health.png",
        color: const Color(0xFFED1E79),
        angel: Angle.right,
      ),
      NewsCategory(
        label: AppLocalizations.of(context)!.business,
        image: "bussines.png",
        color: const Color(0xFFCF7E48),
        angel: Angle.left,
      ),
      NewsCategory(
        label: AppLocalizations.of(context)!.environment,
        image: "environment.png",
        color: const Color(0xFF4882CF),
        angel: Angle.right,
      ),
      NewsCategory(
        label: AppLocalizations.of(context)!.science,
        image: "science.png",
        color: const Color(0xFFF2D352),
        angel: Angle.left,
      )
    ];
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
              AppLocalizations.of(context)!.pickcategory,
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
