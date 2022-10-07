import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/demos/my_collections_demos.dart';

import 'package:flutter_full_learn_vb/product/language/language_items.dart';

import 'navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.navigationAppbarTitle),
      ),
      body: MyBuilderPlaceHolder(selectedItems: selectedItems),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.chevron_right_sharp),
      ),
    );
  }
}

// ------------ Parcali Kodlar ------------

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget, {Object? arguman}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: true,
        settings: RouteSettings(arguments: arguman),
        maintainState: true,
      ),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: true,
        settings: const RouteSettings(),
        maintainState: true,
      ),
    );
  }
}

class MyBuilderPlaceHolder extends StatefulWidget {
  MyBuilderPlaceHolder({super.key, required this.selectedItems});
  List<int> selectedItems;

  @override
  State<MyBuilderPlaceHolder> createState() => _MyBuilderPlaceHolderState();
}

class _MyBuilderPlaceHolderState extends State<MyBuilderPlaceHolder> with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: PaddingUtility().paddingGenaral,
          child: TextButton(
            onPressed: () async {
              final response = await navigateToWidgetNormal<bool>(
                context,
                NavigateDetailLearnDart(
                  isOkey: widget.selectedItems.contains(index),
                ),
              );

              if (response is bool) {
                addSelected(index, response);
              }
            },
            child: Column(
              children: [
                Placeholder(
                  color: widget.selectedItems.contains(index) ? Colors.green : Colors.red,
                ),
                widget.selectedItems.contains(index)
                    ? TextButton(
                        onPressed: () {
                          widget.selectedItems.remove(index);
                          setState(() {});
                        },
                        child: const Text("Vazgec"),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }

  void addSelected(int index, bool isAdd) {
    isAdd ? widget.selectedItems.add(index) : widget.selectedItems.remove(index);
    setState(() {});
  }
}
