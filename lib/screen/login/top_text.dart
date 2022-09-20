

import 'package:flutter/material.dart';

import 'Login_content.dart';

class TopText extends StatelessWidget {
  final Screen screen;
  const TopText({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Create Account',
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
