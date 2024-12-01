import 'package:flutter/material.dart';
import 'package:newsapp/Screens/HomeScreen/DrawerWidget/CustomDrawerWidget.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/CategoryTab/CategoryTab.dart';
import 'package:newsapp/Screens/HomeScreen/Tabs/SettingsTab/Settings.dart';

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

  int tabId = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  tabId == Settings.id ? "Settings" : 'News App',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              drawer: CustomDrawerWidget(
                onTab: changeTab,
              ),
              body: tabs[tabId]),
        ),
      ],
    );
  }

  changeTab(tabId) {
    setState(() {
      this.tabId = tabId;
    });
    Navigator.pop(context);
  }
}
