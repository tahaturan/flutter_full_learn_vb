import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  bool _isVisible = false;

  bool _isOpacity = false;

  late AnimationController controller;

  void _chanceVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems.durationLow,
              opacity: _isOpacity ? 1 : 0,
              child: const Text('data'),
            ),
            trailing: IconButton(
              onPressed: () {
                _changeOpacity();
              },
              icon: const Icon(Icons.add),
            ),
          ),
          AnimatedDefaultTextStyle(
            style: (_isVisible ? context.textTheme().subtitle1 : context.textTheme().headline1) ?? const TextStyle(),
            duration: _DurationItems.durationLow,
            child: const Text('data'),
          ),
          AnimatedIcon(
            icon: AnimatedIcons.pause_play,
            progress: controller,
          ),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            width: MediaQuery.of(context).size.width * 0.2,
            height: _isVisible ? kZero : MediaQuery.of(context).size.height * 0.2,
            color: _isVisible ? Colors.green : Colors.red,
            margin: _isVisible ? const EdgeInsets.all(20) : const EdgeInsets.only(left: 70),
          ),
          Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                duration: _DurationItems.durationLow,
                left: _isVisible ? 20 : 50,
                curve: Curves.easeInCirc,
                child: const Text('data'),
              )
            ],
          )),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return const Text('data');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _chanceVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      duration: _DurationNewItems.durationHight.duration(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

extension BuildContexExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const Duration durationLow = Duration(seconds: 1);
}

enum _DurationNewItems { durationLow, durationHight }

extension _DurationValue on _DurationNewItems {
  Duration duration() {
    switch (this) {
      case _DurationNewItems.durationLow:
        return const Duration(seconds: 1);
      case _DurationNewItems.durationHight:
        return const Duration(seconds: 2);
    }
  }
}
