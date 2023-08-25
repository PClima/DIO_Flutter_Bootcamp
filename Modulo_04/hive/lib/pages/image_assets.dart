import 'package:flutter/material.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "lib/images/user1.png",
          height: 80,
        ),
        Image.asset(
          "lib/images/user2.png",
          height: 80,
        ),
        Image.asset(
          "lib/images/user3.png",
          height: 80,
        ),
        Image.asset(
          "lib/images/paisagem1.jpg",
          width: double.infinity,
        ),
        Image.asset(
          "lib/images/paisagem2.jpg",
          height: 80,
        ),
        Image.asset(
          "lib/images/paisagem3.jpg",
          height: 80,
        )
      ],
    );
  }
}
