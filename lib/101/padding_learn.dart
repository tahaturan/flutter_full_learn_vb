import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});
  final String title = "Paddin Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: ProjectPadding.pagePaddingVertical,
            child: Container(
              height: 100,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: ProjectPadding.pagePaddingRightOnly,
            child: Container(
              height: 100,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: ProjectPadding.pagePaddingRightOnly + ProjectPadding.pagePaddingVertical,
            child: const Text("data"),
          )
        ],
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddinghorizontal = EdgeInsets.symmetric(horizontal: 10);

  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
  static const customSeetCloseIconPadding = EdgeInsets.only(top: 1, right: 2);
}
