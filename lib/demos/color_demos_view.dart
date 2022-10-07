// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element, unused_field
// bir ekran olacak
// bu ekranda 3 botun ve bunlara basinda renk degisimi olacak

import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  ColorDemosView({
    Key? key,
    this.initialColor,
  }) : super(key: key);

  Color? initialColor;

  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backgroundColor;
  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeColor(widget.initialColor!);
    }
  }

  void changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: _MyContainerWidget(color: Colors.red), label: "Red"),
          BottomNavigationBarItem(icon: _MyContainerWidget(color: Colors.green), label: "Green"),
          BottomNavigationBarItem(icon: _MyContainerWidget(color: Colors.blue), label: "Blue"),
        ],
        onTap: _colorOnTap,
      ),
      backgroundColor: _backgroundColor,
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeColor(Colors.red);
    } else if (value == _MyColors.green.index) {
      changeColor(Colors.green);
    }
    if (value == _MyColors.blue.index) {
      changeColor(Colors.blue);
    }
  }
}

enum _MyColors {
  red,
  green,
  blue,
}

class _MyContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;

  const _MyContainerWidget({super.key, this.width = 10, this.height = 10, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height, color: color);
  }
}
