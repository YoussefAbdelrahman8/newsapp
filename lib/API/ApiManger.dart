import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/DataClasses/ArticleManger.dart';
import 'package:newsapp/DataClasses/SourceManger.dart';
import 'package:newsapp/Provider/SettingsProvider.dart';
import 'package:provider/provider.dart';

class ApiManger {
  static getSources(String category, BuildContext context) async {
    SettingsProvider settings =
        Provider.of<SettingsProvider>(context, listen: false);
    String language = settings.locale.languageCode;
    Uri url = Uri.https(
      "newsapi.org",
      "v2/top-headlines/sources",
      {
        "apiKey": "0045d79bfd66468c82ff637105162d38",
        "language": language,
        "category": category
      },
    );
    http.Response respond = await http.get(url);
    Map<String, dynamic> json = jsonDecode(respond.body);
    SourceManger source = SourceManger.fromJson(json);
    return source;
  }

  static getArticles(
      String sourceId, String searchIn, BuildContext context) async {
    SettingsProvider settings =
        Provider.of<SettingsProvider>(context, listen: false);
    String language = settings.locale.languageCode;
    Uri url = Uri.https(
      "newsapi.org",
      "v2/everything",
      {
        "apiKey": "0045d79bfd66468c82ff637105162d38",
        "language": language,
        "sources": sourceId,
        "q": searchIn
      },
    );
    http.Response respond = await http.get(url);
    Map<String, dynamic> json = jsonDecode(respond.body);
    ArticleManger article = ArticleManger.fromJson(json);
    return article;
  }
}
