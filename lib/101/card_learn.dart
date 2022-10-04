// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});
  final String title = "Card Learn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          _CustomCard(child: const Center(child: Text("Ali"))),
          _CustomCard(child: const Center(child: Text("Ali"))),
          _CustomCard(child: const Center(child: Text("Ali"))),
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final Widget child;
  _CustomCard({
    Key? key,
    required this.child,
  }) : super(key: key);
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: ProjectMargins.cardMargin,
      // shape: roundedRectangleBorder,
      child: SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text("Ali")),
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

// -------- Border ------------
// StadiumBorder()
// CircleBorder()
// RoundedRectangleBorder()