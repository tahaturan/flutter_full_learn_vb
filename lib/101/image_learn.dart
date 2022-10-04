import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String title = "Image Learn";
  final String imagePath =
      "https://freepngimg.com/thumb/apple_fruit/133239-book-apple-free-transparent-image-hd.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: PngImage(name: ImageItems().appleBookWithOutPath),
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: Image.network(
              imagePath,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleWithBook = "assets/apple-and-book.png";
  final String appleBook = "assets/png/ic_apple_with_school.png";
  final String appleBookWithOutPath = "ic_apple_with_school";
}

class PngImage extends StatelessWidget {
  final String name;
  const PngImage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => "assets/png/$name.png";
}
