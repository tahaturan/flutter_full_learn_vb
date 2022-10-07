import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.listViewLearnAppbarTitle),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(child: Text("Merhaba", style: Theme.of(context).textTheme.headline1, maxLines: 1)),
          Container(color: Colors.red, height: 300),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.red, width: 200),
                Container(color: Colors.white, width: 200),
                Container(color: Colors.blue, width: 200),
                Container(color: Colors.green, width: 200),
              ],
            ),
          ),
          const Icon(Icons.add),
        ],
      ),
    );
  }
}
