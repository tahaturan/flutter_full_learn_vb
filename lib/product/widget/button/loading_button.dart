// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final Future<void> Function() onPressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void chanceLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (_isLoading) return;
          chanceLoading();
          await widget.onPressed.call();
          chanceLoading();
        },
        child: Center(child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : Text(widget.title)),
      ),
    );
  }
}
