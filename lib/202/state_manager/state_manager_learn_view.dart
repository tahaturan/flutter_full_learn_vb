import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/state_manager/state_learn_view_model.dart';

class StateManagerLearnView extends StatefulWidget {
  const StateManagerLearnView({super.key});

  @override
  State<StateManagerLearnView> createState() => _StateManagerLearnViewState();
}

class _StateManagerLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isVisible ? Colors.green : Colors.red,
        shadowColor: isOpacity ? Colors.pink : Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          chanceVisible();
        },
      ),
    );
  }
}
