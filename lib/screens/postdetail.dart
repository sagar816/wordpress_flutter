import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final data;
  const PostDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("WP Flutter - Latest Post"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Center(
                child: Container(
              margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: Text(
                data['title']['rendered'],
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            )),
            Image.network(
                data["_embedded"]["wp:featuredmedia"][0]["source_url"]),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
              data['content']['rendered']
                  .toString()
                  .replaceAll("<p>","")
                  .replaceAll("</p>","")
                  .replaceAll("<b>","")
                  .replaceAll("</b>",""),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ));
  }
}
