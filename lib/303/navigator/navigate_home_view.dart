import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf, arguments: 'abc');
        },
        child: const Icon(Icons.arrow_right_alt_outlined),
      ),
      body: Container(),
    );
  }
}
