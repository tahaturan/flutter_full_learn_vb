import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({Key? key}) : super(key: key);
  final String title = "Color Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: ColorsItems.atlantis,
        child: const Text("data"),
      ),
    );
  }
}

class ColorsItems {
  static const Color danube = Color(0xff7392D3);
  static const Color atlantis = Color.fromRGBO(90, 219, 57, 1);
}
