import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:news_app/model/newsmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  // Define a GlobalKey for the RepaintBoundary widget
  final GlobalKey repainkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Article? article =
        ModalRoute.of(context)?.settings.arguments as Article?;

    if (article == null) {
      return const Scaffold(
        body: Center(child: Text('No article data found!')),
      );
    }

    Future<void> shareImage() async {
      // Use the GlobalKey to find the RenderObject
      RenderRepaintBoundary renderRepaintBoundary =
          repainkey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      var image = await renderRepaintBoundary.toImage(pixelRatio: 5);

      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

      Uint8List fetchImage = byteData!.buffer.asUint8List();

      Directory directory = await getApplicationCacheDirectory();

      String path = directory.path;

      File file = File('$path.png');

      file.writeAsBytes(fetchImage);

      // Share the image using the ShareExtend package
      ShareExtend.share(file.path, "Image");
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(onPressed: shareImage, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.save_alt))
        ],
      ),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: repainkey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${article.category}",
                        style: TextStyle(fontSize: 19),
                      ),
                      Text(
                        "${article.pubDate}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    "${article.title}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    "${article.sourceName}",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Image.network("${article.imageUrl}"),
                  Text(
                    "${article.description}",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "${article.link}",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
