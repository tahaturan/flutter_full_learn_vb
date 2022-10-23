// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/product/widget/button/answer_button.dart';
import 'package:flutter_full_learn_vb/product/widget/button/loading_button.dart';
import 'package:flutter_full_learn_vb/product/widget/call_back_dorpdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CallBackDropdown(onUserSelected: (CallBackUser user) {
              // ignore: avoid_print
              print(user);
            }),
            AnswerButton(onNumber: (number) {
              return number % 3 == 1;
            }),
            LoadingButton(
              title: "Save",
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
            )
          ],
        ),
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  //TODO: Dummy Remove it
  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser('vb', 123),
      CallBackUser('vb1', 124),
      CallBackUser('vb2', 2),
    ];
  }

  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
