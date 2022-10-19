import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/cache/user_cache/shared_floating_action_button.dart';
import 'package:flutter_full_learn_vb/202/cache/user_cache/user_items.dart';

import 'package:flutter_full_learn_vb/202/cache/user_model.dart';

import 'shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialze();
  }

  Future<void> _initialze() async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  void saveItem() async {
    changeLoading();
    await _manager.saveString(SharedKeys.counter, _currentValue.toString());
    changeLoading();
  }

  void removeItem() async {
    changeLoading();
    await _manager.removeItem(SharedKeys.counter);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        centerTitle: true,
        actions: [
          _loading(context),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SharedFloatingActionButton(icon: Icons.save_alt_outlined, onPressed: saveItem),
          SharedFloatingActionButton(icon: Icons.remove_circle_outline, onPressed: removeItem)
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor))
        : const SizedBox.shrink();
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
