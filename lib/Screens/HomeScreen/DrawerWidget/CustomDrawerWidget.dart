import 'package:flutter/material.dart';
import 'package:newsapp/Screens/HomeScreen/DrawerWidget/DrawerItem.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/CategoryTab/CategoryTab.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/SettingsTab/Settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawerWidget extends StatelessWidget {
  Function(int) onTab;

  CustomDrawerWidget({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 110,
            color: Theme.of(context).colorScheme.primary,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.newsappp,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          DrawerItem(
            id: CategoryTab.id,
            label: AppLocalizations.of(context)!.categories,
            icon: Icons.view_list_sharp,
            onTab: onTab,
          ),
          DrawerItem(
            id: Settings.id,
            label: AppLocalizations.of(context)!.settings,
            icon: Icons.settings,
            onTab: onTab,
          ),
        ],
      ),
    );
  }
}
