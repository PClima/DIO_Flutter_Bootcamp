import 'dart:convert';

import 'package:trilhaapp/model/http/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:trilhaapp/repositories/jsonplaceholder_custom_dio.dart';

class CommentsDioRepository {
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();

    var response =
        await jsonPlaceHolderCustomDio.dio.get("/posts/$postId/comments");

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
