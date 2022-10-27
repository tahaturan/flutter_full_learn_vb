import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/product/global/resoruce_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ""),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ResourceContext>().celar();
            },
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
      body: ImagePaths.ic_apple_with_school.toWidget(height: 150),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  ic_apple_with_school
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 50}) {
    return Image.asset(path(), height: height);
  }
}
