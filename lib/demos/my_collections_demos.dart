import 'package:flutter/material.dart';

import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.myCollectionsDemosAppbarTitle),
      ),
      body: ListView.builder(
        padding: PaddingUtility().paddingHorizontal,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          CollectionModel collection = _items[index];
          return _CategoryCard(collection: collection);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required this.collection,
  }) : super(key: key);

  final CollectionModel collection;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingGenaral,
        child: Column(
          children: [
            Image.asset(
              collection.imagePath,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(collection.title),
                  Text("${collection.price} Eth"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;
  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(imagePath: ProjectImage.imageCollection, title: "title 1", price: 3.15),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: "title 2", price: 4.55),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: "title 3", price: 5.35),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: "title 4", price: 9.85),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: "title 5", price: 3.25),
    ];
  }
}

class ProjectImage {
  static const String imageCollection = "assets/png/image_collection.png";
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGenaral = const EdgeInsets.all(20);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}
