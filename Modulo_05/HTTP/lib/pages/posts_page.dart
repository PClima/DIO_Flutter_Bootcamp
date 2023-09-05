import 'package:flutter/material.dart';
import 'package:trilhaapp/model/http/post_model.dart';
import 'package:trilhaapp/pages/comments_page.dart';
import 'package:trilhaapp/repositories/posts/dio/posts_dio_repository.dart';
import 'package:trilhaapp/repositories/posts/posts_repository_ie.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostsRepository postRepository = PostsDioRepository();
  var posts = <PostModel>[];
  bool carregando = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    setState(() {
      carregando = true;
    });

    posts = await postRepository.getPosts();

    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: carregando
          ? const LinearProgressIndicator()
          : Scaffold(
              appBar: AppBar(
                title: const Text("Posts"),
              ),
              body: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (_, index) {
                  var post = posts[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8)),
                          Text(
                            post.title!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                post.body!,
                                style: const TextStyle(fontSize: 15),
                                textAlign: TextAlign.left,
                              )),
                          Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommentsPage(id: post.id)));
                                  },
                                  child: const Text(
                                    "Ler Mais",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
