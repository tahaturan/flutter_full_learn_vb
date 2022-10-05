import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});
  final String title = "Column - Row Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(flex: 4, child: Container(color: Colors.red)),
          Expanded(flex: 2, child: Container(color: Colors.blue)),
          Expanded(flex: 2, child: Container(color: Colors.teal)),
          Expanded(flex: 2, child: Container(color: Colors.amber)),
        ],
      ),
    );
  }
}
