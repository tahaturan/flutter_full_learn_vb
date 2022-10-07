import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _bacroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _changeBackround,
            icon: const Icon(Icons.clear),
          )
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(child: ColorDemosView(initialColor: _bacroundColor)),
        ],
      ),
    );
  }

  void _changeBackround() {
    setState(() {
      _bacroundColor = Colors.pink;
    });
  }
}
