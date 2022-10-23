// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallBackDropdown extends StatefulWidget {
  const CallBackDropdown({
    Key? key,
    required this.onUserSelected,
  }) : super(key: key);

  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallBackDropdown> createState() => _CallBackDropdownState();
}

class _CallBackDropdownState extends State<CallBackDropdown> {
  CallBackUser? _user;

  void _updateUser(CallBackUser? item) {
    setState(() {
      _user = item;
    });

    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
      value: _user,
      items: CallBackUser.dummyUsers().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e.name, style: Theme.of(context).textTheme.headline3),
        );
      }).toList(),
      onChanged: _updateUser,
    );
  }
}
