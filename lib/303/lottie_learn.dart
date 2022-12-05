import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/product/global/theme_notifer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../product/constants/duration_items.dart';
import '../product/constants/lottie_items.dart';

class LottieLenar extends StatefulWidget {
  const LottieLenar({super.key});

  @override
  State<LottieLenar> createState() => _LottieLenarState();
}

class _LottieLenarState extends State<LottieLenar> with TickerProviderStateMixin {
  late AnimationController controller;
  bool _isLight = false;

  void _changeTheme() {
    _isLight = !_isLight;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNomal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              _changeTheme();
              controller.animateTo(_isLight ? 1 : 0.5);

              Future.microtask(
                () {
                  context.read<ThemeNotifer>().chanceTheme();
                },
              );
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller,
            ),
          ),
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key});

  final String _lottieUrl = 'https://assets9.lottiefiles.com/packages/lf20_p8bfn5to.json';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_lottieUrl),
    );
  }
}
