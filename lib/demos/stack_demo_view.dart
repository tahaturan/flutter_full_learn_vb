import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/core/ramdom_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final String title = "Stack Demo View";
  final double cardWidth = 200;
  final double cardHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    bottom: cardHeight / 2,
                    child: const RandomImage(),
                  ),
                  Positioned(
                    width: cardWidth,
                    bottom: 0,
                    height: cardHeight,
                    child: _cardCustom(),
                  ),
                ],
              )),
          const Spacer(flex: 6),
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
