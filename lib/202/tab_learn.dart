import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/demos/color_demos_view.dart';
import 'package:flutter_full_learn_vb/demos/color_life_cycle_view.dart';
import 'package:flutter_full_learn_vb/demos/my_collections_demos.dart';
import 'package:flutter_full_learn_vb/demos/note_demos_view.dart';
import 'package:flutter_full_learn_vb/demos/stack_demo_view.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchValue = 7;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(LanguageItems.tabbLearnAppbarTitle),
        ),
        body: _tabbarView(),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchValue,
          child: _myTabbView(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
          child: const Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
      ),
    );
  }

  TabBar _myTabbView() {
    return TabBar(
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) {
        return Tab(text: e.name);
      }).toList(),
    );
  }

  TabBarView _tabbarView() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        MyCollectionsDemos(),
        StackDemoView(),
        NoteDemos(),
        ColorLifeCycleView(),
      ],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
