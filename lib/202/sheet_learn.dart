// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/101/padding_learn.dart';
import 'package:flutter_full_learn_vb/demos/color_demos_view.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            showCustomSheet(context, ColorDemosView());
          },
          child: const Text(
            "CustomSheet",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const _CustomSheet();
              });
          if (result is bool && result == true) {
            setState(() {
              _backgroundColor = Colors.green;
            });
          } else {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.arrow_drop_up_outlined),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Divider(
                color: Colors.grey,
                thickness: 3,
                indent: MediaQuery.of(context).size.width * 0.45,
                endIndent: MediaQuery.of(context).size.width * 0.45,
              ),
              Positioned(
                height: 10,
                top: 1,
                right: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close_outlined),
                ),
              ),
            ],
          ),
          const Text("data22"),
          Image.network('https://picsum.photos/200', height: 200),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _backgroundColor = Colors.green;
              });
              Navigator.of(context).pop<bool>(false);
            },
            child: const Text(
              "OK",
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const _BaseSheetStack(), Expanded(child: child)],
      ),
    );
  }
}

class _BaseSheetStack extends StatelessWidget {
  const _BaseSheetStack({
    Key? key,
  }) : super(key: key);
  final double _height = 25;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: DividerThickness.medium.value(),
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
            top: 0,
            right: MediaQuery.of(context).size.width * 0.01,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: ProjectPadding.customSeetCloseIconPadding,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        // isScrollControlled: true,
        context: context,
        builder: (context) {
          return _CustomMainSheet(child: child);
        });
  }
}

enum DividerThickness { small, medium, large }

extension DividerThicknessValue on DividerThickness {
  double value() {
    switch (this) {
      case DividerThickness.small:
        return 2.0;

      case DividerThickness.medium:
        return 3.0;
      case DividerThickness.large:
        return 5.0;
    }
  }
}
