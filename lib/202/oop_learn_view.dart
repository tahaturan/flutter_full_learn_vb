import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/oop_learn.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({super.key});

  @override
  State<OopLearnView> createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {
  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  FileDownload? download;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Center(child: CircularProgressIndicator(color: Colors.white))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.downloadItem(null);
        },
      ),
    );
  }
}
