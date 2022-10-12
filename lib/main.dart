import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '202/service/service_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.white,
            circularTrackColor: Colors.red,
          ),
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            shape: const CircularNotchedRectangle(),
            color: Colors.lightBlue[700],
          )),
      home: const ServiceLearn(),
    );
  }
}
