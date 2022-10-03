import 'dart:ui';

import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text("a" * 500),
          ),
          SizedBox.shrink(
            child: Text("c" * 50),
          ),
          SizedBox.square(
            dimension: 50,
            child: Text("b" * 50),
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 150,
              minWidth: 100,
              maxHeight: 150,
              minHeight: 100,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(30),
            decoration: ProjectContainerDecoration(),
            child: Text("aaa" * 3),
          ),
        ],
      ),
    );
  }
}

class ProjetUtilty {
  static final BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.red,
    border: Border.all(width: 5),
    shape: BoxShape.circle,
    boxShadow: const [
      BoxShadow(
        blurRadius: 40,
        blurStyle: BlurStyle.inner,
        color: Colors.green,
        spreadRadius: 5,
        offset: Offset(50, -15),
      ),
      BoxShadow(
        blurRadius: 80,
        blurStyle: BlurStyle.inner,
        color: Colors.red,
        spreadRadius: 5,
        offset: Offset(50, -15),
      ),
    ],
    gradient: const LinearGradient(
      colors: [
        Colors.red,
        Colors.black,
        // Colors.white,
      ],
    ),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          color: Colors.red,
          border: Border.all(width: 5),
          // shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              blurRadius: 40,
              blurStyle: BlurStyle.inner,
              color: Colors.green,
              spreadRadius: 5,
              offset: Offset(50, -15),
            ),
            BoxShadow(
              blurRadius: 80,
              blurStyle: BlurStyle.inner,
              color: Colors.red,
              spreadRadius: 5,
              offset: Offset(50, -15),
            ),
          ],
          gradient: const LinearGradient(
            colors: [
              Colors.red,
              Colors.white,
              // Colors.white,
            ],
          ),
        );
}
