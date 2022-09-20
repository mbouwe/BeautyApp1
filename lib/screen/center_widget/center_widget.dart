import 'package:flutter/material.dart';

class Centerwidget extends StatelessWidget {
  final Size size;

  const Centerwidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(-0.5, -0.6),
                    end: Alignment(1,-0.8),
                    colors: [
                      Color(0xB3BF8BE5),
                      Color(0xB3CC75F1),
                    ]
                )
            ),
          ),
        )
      ],

    );
  }
}
