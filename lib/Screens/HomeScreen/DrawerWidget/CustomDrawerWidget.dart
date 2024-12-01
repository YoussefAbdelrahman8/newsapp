import 'package:flutter/material.dart';
import 'package:newsapp/Screens/HomeScreen/DrawerWidget/DrawerItem.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/CategoryTab/CategoryTab.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/SettingsTab/Settings.dart';

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
                "News App!",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          DrawerItem(
            id: CategoryTab.id,
            label: "Categories",
            icon: Icons.view_list_sharp,
            onTab: onTab,
          ),
          DrawerItem(
            id: Settings.id,
            label: "Settings",
            icon: Icons.settings,
            onTab: onTab,
          ),
        ],
      ),
    );
  }
}
