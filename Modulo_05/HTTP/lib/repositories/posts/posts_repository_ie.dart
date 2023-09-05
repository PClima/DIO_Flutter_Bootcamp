import 'package:trilhaapp/model/http/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}
