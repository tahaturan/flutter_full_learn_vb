import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);

  final String title = "Welcome Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Icon(Icons.mark_email_unread_sharp),
          Center(child: CircularProgressIndicator()),
        ],
      ),
      body: Container(),
    );
  }
}
