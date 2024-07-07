import 'dart:convert';

import 'package:http_fetch_by_riverpod/model/post.dart';
import 'package:http/http.dart';

class ApiService {
  String url = "https://jsonplaceholder.typicode.com/photos?_limit=7";

  Future<List<PostModel>> getData() async {
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => PostModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
