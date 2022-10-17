import 'package:flutter/material.dart';

import 'state_manager_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManagerLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;

  bool isOpacity = false;

  late AnimationController controller;

  void chanceVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
