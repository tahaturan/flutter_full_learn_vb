import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/core/ramdom_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final String title = 'List Tile Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          ListTile(
            title: const RandomImage(),
            subtitle: const Text("How do you use your card"),
            leading: const Icon(Icons.money),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
