// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class AlertLenar extends StatefulWidget {
  const AlertLenar({super.key});

  @override
  State<AlertLenar> createState() => _AlertLenarState();
}

class _AlertLenarState extends State<AlertLenar> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            context: context,
            builder: (context) {
              return const _ImageZoomDialog();
            },
          );

          if (response is bool && response) {
            setState(() {
              _backgroundColor = Colors.green;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("alert"),
      content: const Text("Icerik"),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text("Okey"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Close",
          ),
        ),
      ],
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 2), borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text("alert"),
          content: const Text("Icerik"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Okey"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Close",
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, width: 2), borderRadius: BorderRadius.all(Radius.circular(20))),
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog();

  final String _url = "https://picsum.photos/200";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(_url, fit: BoxFit.cover, height: MediaQuery.of(context).size.height * 0.5),
      ),
    );
  }
}
