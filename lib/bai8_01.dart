import 'package:flutter/material.dart';
import 'package:labtonghop/api.dart';
import 'package:labtonghop/model/articles.dart';
import 'package:labtonghop/myappnewsdetail.dart';

class MyAppNews01 extends StatefulWidget {
  const MyAppNews01({super.key});

  @override
  State<MyAppNews01> createState() => _MyAppNews01State();
}

class _MyAppNews01State extends State<MyAppNews01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: MyAPI.getAllArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return myListArticles(snapshot.data!);
          } else {
            return Center(child: Text("Không có dữ liệu"));
          }
        },
      ),
    );
  }

  Widget myListArticles(List<Article> ls) {
    return ListView.builder(
      itemCount: ls.length,
      itemBuilder: (context, index) {
        return buttomNextPage(context, ls[index]);
      },
    );
  }

  Widget buttomNextPage(BuildContext context, Article a) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Myappnewsdetail(article: a)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
        ),
        child: Column(
          children: [
            Image.network(
              a.urlToImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    a.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    a.description,
                    style: TextStyle(color: Colors.black87),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
