import 'package:flutter/material.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Samples"),
      ),
      body: const Text("Merhaba"),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: "one"),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: "two"),
        ],
        showSelectedLabels: false,
      ),
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 200,
              );
            },
            // barrierColor: Colors.white,
          );
        },
        child: const Icon(Icons.add),
        // mini: true,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      drawer: const Drawer(),
    );
  }
}
