import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.listViewBuilderLearnAppbarTitle),
      ),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.white);
        },
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [Expanded(child: Image.network("https://picsum.photos/200")), Text("${index + 1}")],
            ),
          );
        },
      ),
    );
  }
}
