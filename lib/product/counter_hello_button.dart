import 'package:flutter/material.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _visitCounter = 0;

  final _welcomeTitle = "Merhaba";

  void visitIncrement() {
    setState(() {
      _visitCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: visitIncrement,
      child: Text("$_welcomeTitle $_visitCounter"),
    );
  }
}
