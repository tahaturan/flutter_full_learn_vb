import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/theme/light_theme.dart';
import 'package:flutter_full_learn_vb/303/reqres_resourse/view/req_res_view.dart';
import 'package:flutter_full_learn_vb/product/global/resoruce_context.dart';
import 'package:flutter_full_learn_vb/product/global/theme_notifer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<ResourceContext>(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifer>(create: (context) => ThemeNotifer())
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifer>().currentTheme,

      // * ********************************
      // ThemeData.dark().copyWith(
      //     appBarTheme: const AppBarTheme(
      //       centerTitle: true,
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       systemOverlayStyle: SystemUiOverlayStyle.light,
      //     ),
      //     cardTheme: CardTheme(
      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //     ),
      //     progressIndicatorTheme: const ProgressIndicatorThemeData(
      //       color: Colors.white,
      //       circularTrackColor: Colors.red,
      //     ),
      //     tabBarTheme: const TabBarTheme(
      //       labelColor: Colors.white,
      //       indicatorSize: TabBarIndicatorSize.label,
      //     ),
      //     bottomAppBarTheme: BottomAppBarTheme(
      //       shape: const CircularNotchedRectangle(),
      //       color: Colors.lightBlue[700],
      //     )),
      // * ******************
      home: const ReqresView(),
    );
  }
}
