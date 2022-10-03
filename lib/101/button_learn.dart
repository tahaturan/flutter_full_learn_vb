import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Learn'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.red;
            })),
            child: Text(
              "Text Button",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text(
              "Elevated Button",
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // servise istek at
              // sayfanin rengini duzenle
              // vs...
            },
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              // shape: const RoundedRectangleBorder(),
              padding: const EdgeInsets.all(20),
            ),
            child: const SizedBox(
              width: 200,
              child: Text("Data", textAlign: TextAlign.center),
            ),
          ),
          InkWell(
            child: const Text("custom"),
            onTap: () {},
          ),
          Container(
            height: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 90, right: 90),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Text(
              "Place Bid",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
