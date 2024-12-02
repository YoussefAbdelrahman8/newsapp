import 'package:flutter/material.dart';
import 'package:newsapp/DataClasses/Source.dart';

import 'SourceTabWidget/SourceTabWidget.dart';

import 'SourceNewsView/SourceNewsView.dart';

class TabBarWidget extends StatelessWidget {
  List<Source> sources;
  String searchKey;

  TabBarWidget({super.key, required this.sources, required this.searchKey});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            padding: const EdgeInsets.all(10),
            isScrollable: true,
            tabs: sources
                .map((source) =>
                    Tab(child: SourceTabWidget(source: source.name ?? "")))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => SourceNewsView(
                        searchKey: searchKey,
                        source: source,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
