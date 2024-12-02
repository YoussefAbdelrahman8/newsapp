import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapp/API/ApiManger.dart';
import 'package:newsapp/DataClasses/Source.dart';

import 'package:newsapp/Screens/HomeScreen/HomeScreen.dart';
import 'package:newsapp/Screens/NewsScreen/SearchTextfield/SearchTextfield.dart';

import 'package:newsapp/Screens/NewsScreen/TabBarWidget/TabBarWidget.dart';

import '../../DataClasses/Category.dart';
import '../../DataClasses/SourceManger.dart';
import '../HomeScreen/DrawerWidget/CustomDrawerWidget.dart';

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
          future: ApiManger.getSources(category.label.toLowerCase()),
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
            List<Source> sources = snapshot.data?.sources??[];
            return TabBarWidget(
              searchKey: searchController.text,
              sources: sources,);
          },
        ),
      ),
    );
  }
}
