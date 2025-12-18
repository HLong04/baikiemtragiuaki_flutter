import 'package:flutter/material.dart';
import 'package:labtonghop/model/articles.dart';
import 'package:url_launcher/url_launcher.dart';

class Myappnewsdetail extends StatelessWidget {
  final Article article;

  const Myappnewsdetail({Key? key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Chi tiết bài báo",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 61, 108),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.urlToImage),
            SizedBox(height: 10),
            Text(
              "Nguồn: ${article.source.name}",
              style: TextStyle(
                color: Color.fromARGB(255, 7, 97, 171),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              article.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 61, 108),
              ),
            ),
            SizedBox(height: 10),
            Text("Ngày đăng: ${article.publishedAt}"),
            SizedBox(height: 10),
            Text(article.description),
            SizedBox(height: 20),
            button(context, article),
          ],
        ),
      ),
    );
  }

  Widget button(BuildContext context, Article a) {
    return ElevatedButton(
      onPressed: () async {
        final Uri url = Uri.parse(a.url);
        await launchUrl(
          url,
          mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
            enableDomStorage: true,
          ),
        );
      },
      child: Text("Trang goc"),
    );
  }
}
