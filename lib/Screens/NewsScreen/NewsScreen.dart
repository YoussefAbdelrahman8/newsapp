import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapp/API/ApiManger.dart';
import 'package:newsapp/DataClasses/Source.dart';
import 'package:newsapp/Screens/HomeScreen/HomeScreen.dart';
import 'package:newsapp/Screens/NewsScreen/TabBarWidget/TabBarWidget.dart';
import '../../DataClasses/Category.dart';
import '../../DataClasses/SourceManger.dart';
import '../HomeScreen/DrawerWidget/CustomDrawerWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = "news";

  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String?, String> categoryMapping = {
      AppLocalizations.of(context)?.sports: 'sports',
      AppLocalizations.of(context)?.science: 'science',
      AppLocalizations.of(context)?.business: 'business',
      AppLocalizations.of(context)?.health: "health",
      AppLocalizations.of(context)?.environment: 'environment',
      AppLocalizations.of(context)?.politics: "politics"
    };
    NewsCategory category =
        ModalRoute.of(context)?.settings.arguments as NewsCategory;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        drawer: isSearch
            ? null
            : CustomDrawerWidget(
                onTab: (id) {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName,
                      arguments: id);
                },
              ),
        appBar: AppBar(
          automaticallyImplyLeading: !isSearch,
          title: isSearch
              ? SizedBox(
                  width: 343,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search Article",
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSearch = false;
                            searchController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSearch = false;
                          });
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                    controller: searchController,
                  ),
                )
              : Text(category.label),
          actions: [
            isSearch
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        isSearch = true;
                        searchController.clear();
                      });
                    },
                  ),
          ],
        ),
        body: FutureBuilder<dynamic>(
          future: ApiManger.getSources(
              categoryMapping[category.label.toLowerCase()] ?? "", context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Try Again"))
                ],
              );
            }
            List<Source> sources = snapshot.data?.sources ?? [];
            if (sources.isEmpty) {
              return const SizedBox(
                  height: 100, child: Text("No sources found."));
            }
            return TabBarWidget(
              searchKey: searchController.text,
              sources: sources,
            );
          },
        ),
      ),
    );
  }
}
