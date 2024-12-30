import 'package:flutter/material.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:news_app/utils/helper/api_helper.dart';

class HomeViewModel extends ChangeNotifier {
  List<Article>? _articles;
  List<Article>? get articles => _articles;

  Future<void> fetchData() async {
    try {
      _articles = await ApiHelper.apiHelper.fetchData();
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
