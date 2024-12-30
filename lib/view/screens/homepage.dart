import 'package:flutter/material.dart';
import 'package:news_app/model/newsmodel.dart';

import 'package:provider/provider.dart';
import '../../viewModel/article.dart';
import 'detailpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Modern News',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.articles == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: viewModel.articles?.length,
              itemBuilder: (context, index) {
                final article = viewModel.articles![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('detail_page', arguments: article);
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    article.imageUrl ?? '',
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      article.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
