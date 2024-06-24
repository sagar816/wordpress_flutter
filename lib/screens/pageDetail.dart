import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  final data;
  const PageDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data['title']['rendered']),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            // Center(
            //     child: Container(
            //   margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            //   child: Text(
            //     data['title']['rendered'],
            //     style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // ),
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
