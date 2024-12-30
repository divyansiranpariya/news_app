import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsmodel.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  Future<List<Article>?> fetchData() async {
    http.Response response = await http.get(Uri.parse(
        "https://newsdata.io/api/1/latest?apikey=pub_63239c5e9e0e7d435a9a393741671948c1591&category=politics&country=bd"));

    if (response.statusCode == 200) {
      String body = response.body;
      Map decodedData = jsonDecode(body);
      List allNews = decodedData["results"];

      List<Article> news = allNews.map((e) => Article.fromdata(e)).toList();
      return news;
    }
  }
}
