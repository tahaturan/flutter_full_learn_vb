import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/product/counter_hello_button.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class SatateFullLearn extends StatefulWidget {
  const SatateFullLearn({super.key});

  @override
  State<SatateFullLearn> createState() => _SatateFullLearnState();
}

class _SatateFullLearnState extends State<SatateFullLearn> {
  int _countValue = 0;

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue++;
    } else {
      _countValue--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.statefullLearnAppbarTitle),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_countValue.toString(), style: Theme.of(context).textTheme.headline1),
            const Placeholder(fallbackHeight: 250),
            const CounterHelloButton(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
