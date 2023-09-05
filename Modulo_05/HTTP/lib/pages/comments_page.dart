import 'package:flutter/material.dart';
import 'package:trilhaapp/model/http/comment_model.dart';
import 'package:trilhaapp/model/http/post_model.dart';
import 'package:trilhaapp/repositories/posts/dio/comments_dio_repository.dart';
import 'package:trilhaapp/repositories/posts/dio/posts_dio_repository.dart';
// import 'package:trilhaapp/repositories/posts/http/comments_http_repository.dart';
// import 'package:trilhaapp/repositories/posts/http/posts_http_repository.dart';

class CommentsPage extends StatefulWidget {
  final int? id;
  const CommentsPage({super.key, this.id});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var postRepository = PostsDioRepository();
  PostModel? post;
  var commentsRepository = CommentsDioRepository();
  var comments = <CommentModel>[];

  bool carregando = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregaPost();
    carregaComentarios();
  }

  carregaPost() async {
    if (widget.id != null) {
      post = await postRepository.getPost(widget.id!);
      setState(() {});
    }
  }

  carregaComentarios() async {
    comments = await commentsRepository.retornaComentarios(widget.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return post == null
        ? const Column(
            children: [LinearProgressIndicator()],
          )
        : Hero(
            tag: widget.id!,
            child: SafeArea(
              child: Scaffold(
                  body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)),
                    Row(
                      children: [
                        Image.network(
                          "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                          height: 100,
                        )
                      ],
                    ),
                    Text(
                      post!.title ?? "",
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        post!.body ?? "",
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Comentários",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (_, index) {
                          var comment = comments[index];
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                Text(
                                  comment.name,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  comment.email,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                ),
                                Text(
                                  comment.body,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
  }
}
