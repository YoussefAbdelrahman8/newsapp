import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/API/ApiManger.dart';
import 'package:newsapp/DataClasses/Article.dart';
import 'package:newsapp/DataClasses/ArticleManger.dart';
import 'package:newsapp/DataClasses/Source.dart';

class SourceNewsView extends StatefulWidget {
  Source source;
  String? searchKey;

  SourceNewsView({super.key, required this.source, required this.searchKey});

  @override
  State<SourceNewsView> createState() => _SourceNewsViewState();
}

class _SourceNewsViewState extends State<SourceNewsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: ApiManger.getArticles(
          widget.source.id ?? "", widget.searchKey ?? "", context),
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

        List<Articles> articles = snapshot.data?.articles ?? [];
        if (articles.isEmpty) {
          return const SizedBox(height: 100, child: Text("No Articles found."));
        }
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: articles[index].urlToImage ?? "",
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ${articles[index].source?.name ?? ""}",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          articles[index].title ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
