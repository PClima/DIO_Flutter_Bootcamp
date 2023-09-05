import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/model/http/post_model.dart';
import 'package:trilhaapp/repositories/posts/posts_repository_ie.dart';

class PostsHttpRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var postsModel = PostModel;
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<PostModel?> getPost(int id) async {
    var postModel = PostModel;
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return PostModel.fromJson(jsonPosts);
    }
  }
}
