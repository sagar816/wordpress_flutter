import 'package:demo_flr_01/screens/postdetail.dart';
import 'package:demo_flr_01/services/mycategory.dart';
// ignore: unused_import
import 'package:demo_flr_01/services/post.dart';
import 'package:flutter/material.dart';

class CategoryPost extends StatefulWidget {
  CategoryPost({Key? key}) : super(key: key);

  @override
  _CategoryPostState createState() => _CategoryPostState();
}

class _CategoryPostState extends State<CategoryPost> {
  MyCategory categoryPostService = MyCategory();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      child: FutureBuilder<List>(
        future: categoryPostService.getCategoryPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.length == 0) {
              return const Center(
                child: Text(" 0 Post"),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Image.network(
                                snapshot.data![i]["_embedded"]["wp:featuredmedia"][0]["source_url"]),
                          ),
                          Expanded(
                              child: Container(
                            margin:
                                const EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: Text(
                              snapshot.data![i]['title']['rendered'],
                              style: const TextStyle(
                                  fontSize: 20.4, fontWeight: FontWeight.bold),
                            ),
                          ))
                        ],
                      ),
                      subtitle: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          snapshot.data![i]['content']['rendered']
                            .toString()
                            .replaceAll("<p>","")
                            .replaceAll("</p>",""),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetail(
                              data:snapshot.data![i]
                            ),
                          ),
                        );
                      },
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            // ignore: prefer_const_constructors
            return Center(
              // ignore: prefer_const_constructors
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
