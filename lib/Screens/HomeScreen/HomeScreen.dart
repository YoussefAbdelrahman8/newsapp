import 'package:flutter/material.dart';
import 'package:newsapp/Screens/HomeScreen/DrawerWidget/CustomDrawerWidget.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/CategoryTab/CategoryTab.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/SettingsTab/Settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<int, Widget> tabs = {
    CategoryTab.id: CategoryTab(),
    Settings.id: const Settings(),
  };
  late int? tabId =
      (ModalRoute.of(context)?.settings.arguments ?? CategoryTab.id) as int?;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              tabId == Settings.id
                  ? AppLocalizations.of(context)!.settings
                  : AppLocalizations.of(context)!.newsapp,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          drawer: CustomDrawerWidget(
            onTab: changeTab,
          ),
          body: tabs[tabId]),
    );
  }

  changeTab(tabId) {
    setState(() {
      this.tabId = tabId;
    });
    Navigator.pop(context);
  }
}
