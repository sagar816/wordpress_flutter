// code to bring posts artical from POST API WP
//first get pub dev http - dependencies
// GET /wp/v2/posts
//$ curl https://example.com/wp-json/wp/v2/posts
//$ curl https://example.com/wp-json/wp/v2/posts?_embed

//make a class in which we will hit api

import 'dart:convert';

import 'package:http/http.dart' as http;

class MyCategory {
  String baseUrl = "https://kalyantechno.com/wp-json/wp/v2/posts?_embed&categories=12";

  Future<List> getCategoryPost() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (SocketException) {
      return Future.error("Error fetching Data");
    }
  }
}
