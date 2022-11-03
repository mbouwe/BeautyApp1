import 'package:beautyapp/screen/Skine/Skine_content.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../utils/constant.dart';
import '../center_widget/center_widget.dart';
import '../home/home.dart';

class SkineScreen extends StatefulWidget {
  const SkineScreen({Key? key}) : super(key: key);

  @override
  State<SkineScreen> createState() => _SkineScreenState();
}

class _SkineScreenState extends State<SkineScreen> {
  Widget topWidget(screenWidth){
    return Transform.rotate(
      angle: -35* math.pi /180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: LinearGradient(
                begin: Alignment(-0.2, -0.2),
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xB3BF8BE5),
                  Color(0xB3BE4EEE),
                ]
            )
        ),
      ),

    );
  }
  Widget bottomWidget(double screenWidth){
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment(0.6, -1.1),
            end: Alignment(0.7,0.8),
            colors: [
              Color(0xB3BF8BE5),
              Color(0xB3BE4EEE),
            ]
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child:topWidget(screenSize.width) ,
          ),
          Positioned(
            bottom: -180,
            left: -40,
            child: bottomWidget(screenSize.width),
          ),
          Centerwidget(size: screenSize),


          const SkineContent(),

        ],
      ),
    );
  }
}
