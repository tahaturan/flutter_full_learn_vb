import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});
  final String title = "Stack Learn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
          Positioned(
            right: 20,
            left: 20,
            top: 100,
            height: 50,
            child: Container(
              color: Colors.green,
            ),
          ),
          Positioned.fill(
            top: 125,
            child: Container(
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
