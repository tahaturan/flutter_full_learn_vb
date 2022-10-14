import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final String _obscureText = "#";
  bool isShowPassword = true;

  final int _durationSeccont = 2;

  void _showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: isShowPassword,
      obscuringCharacter: _obscureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: "Password",
        suffixIcon: _onVisibilityIcon(),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: _showPassword,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState: isShowPassword ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: _durationSeccont),
      ),
      // icon: Icon(isShowPassword ? Icons.visibility : Icons.visibility_off),
    );
  }
}
