import 'package:flutter/material.dart';

class StateFulLifeCyleLearn extends StatefulWidget {
  const StateFulLifeCyleLearn({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  State<StateFulLifeCyleLearn> createState() => _StateFulLifeCyleLearnState();
}

class _StateFulLifeCyleLearnState extends State<StateFulLifeCyleLearn> {
  final String isOddTitle = "Cift";
  final String isEvenTitle = "Tek";
  String _message = "";
  late final bool _isOdd;

  @override
  void didUpdateWidget(covariant StateFulLifeCyleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;

    _computeName();
  }

  void _computeName() {
    _isOdd ? _message += " Cift" : " Tek";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isOdd ? Text(isOddTitle) : Text(isEvenTitle),
      ),
      body: _isOdd ? myElevatedButton() : myTextButton(),
    );
  }

  TextButton myTextButton() {
    return TextButton(
      onPressed: () {},
      child: Text(_message),
    );
  }

  ElevatedButton myElevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(_message),
    );
  }
}
