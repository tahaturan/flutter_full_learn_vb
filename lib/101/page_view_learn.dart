import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/101/icon_learn.dart';
import 'package:flutter_full_learn_vb/101/image_learn.dart';
import 'package:flutter_full_learn_vb/101/stack_learn.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _curretPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _curretPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.pageViewLearnAppbarTitle),
      ),
      body: PageView(
        padEnds: true,
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const StackLearn(),
        ],
      ),
      //* -------------------------------------------------------------
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Page : ${_curretPageIndex + 1}"),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(duration: DurationUtilty.durationLow, curve: Curves.easeInOutQuart);
            },
            child: const Icon(Icons.chevron_left_rounded),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(duration: DurationUtilty.durationLow, curve: Curves.linear);
            },
            child: const Icon(Icons.chevron_right_outlined),
          ),
          // *-----------------------------------------------------------
        ],
      ),
    );
  }
}

class DurationUtilty {
  static const durationLow = Duration(seconds: 1);
}
