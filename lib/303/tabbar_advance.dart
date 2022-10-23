import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/303/feed_view.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class TabbarAdvanceLearn extends StatefulWidget {
  const TabbarAdvanceLearn({super.key});

  @override
  State<TabbarAdvanceLearn> createState() => _TabbarAdvanceLearnState();
}

class _TabbarAdvanceLearnState extends State<TabbarAdvanceLearn> with TickerProviderStateMixin {
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
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined),
            ),
          ],
        ),
        body: _tabbarView(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
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
      children: [
        const FeedView(),
        Center(child: Text(_MyTabViews.settings.name)),
        Center(child: Text(_MyTabViews.favorite.name)),
        Center(child: Text(_MyTabViews.profile.name)),
      ],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
