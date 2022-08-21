// ignore_for_file: unused_import

import 'package:http/http.dart' as http;

class PostRepo {
  Future<http.Response> getPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    return await http.get(url);
  }
}
