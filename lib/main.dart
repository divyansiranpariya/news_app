import 'package:flutter/material.dart';
import 'package:news_app/view/screens/homepage.dart';
import 'package:news_app/view/screens/detailpage.dart';
import 'package:news_app/viewModel/article.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
          'detail_page': (context) => DetailPage(),
        },
      ),
    );
  }
}
