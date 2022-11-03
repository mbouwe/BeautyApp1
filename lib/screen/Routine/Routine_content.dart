import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:beautyapp/screen/goals/goals_Screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../api/api.dart';
import '../../utils/constant.dart';
import '../center_widget/center_widget.dart';

class Routine_content extends StatefulWidget {
  String? value;
   Routine_content({Key? key,required this.value}) : super(key: key);




  @override
  State<Routine_content> createState() => _Routine_contentState();
}

class _Routine_contentState extends State<Routine_content> with TickerProviderStateMixin {

  var UserData, long, data, taille;
  late int? long1 = 0;





  void initState() {
    _getgoals();

    super.initState();
  }

  void _getgoals() async {
    var res = await CallApi().getData('get_routine/${widget.value}');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      setState(() {
        data = body;
        taille = data['routines'];
        var i = 0;
        for (var ted in taille) {
          i++;
        }
        long1 = i;
      });
    }
  }


  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment(0.6, -1.1),
            end: Alignment(0.7, 0.8),
            colors: [
              Color(0xB3BF8BE5),
              Color(0xB3BE4EEE),
            ]),
      ),
    );
  }
  Widget topWidget(screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(
                begin: Alignment(-0.2, -0.2),
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xB3BF8BE5),
                  Color(0xB3BE4EEE),
                ])),
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
            child: topWidget(screenSize.width),
          ),
          Positioned(
            bottom: -180,
            left: -40,
            child: bottomWidget(screenSize.width),
          ),
          Centerwidget(size: screenSize),
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                spawnMaxRadius: 50,
                spawnMinSpeed: 10.00,
                particleCount: 68,
                spawnMaxSpeed: 50,
                minOpacity: 0.1,
                baseColor: Colors.white,
              ),
            ),
            vsync: this,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Goals_Screen();
                              }));
                        },
                        color: Colors.pink,
                      ),
                      const Text(
                        'Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: KPrimaryColor),
                      ),


                    ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Text(
                          'Routines',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: KPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var i = 0; i < long1!; i++)
                    Container(
                      height: 200,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: KSecondaryColor,
                          child: Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 18),
                                child: Text(
                                  data['routines'][i]['title'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                              ),
                             Divider(color: Colors.white,),
                              SizedBox(height: 20,),
                              SingleChildScrollView(
                                child: Text(
                                  data['routines'][i]['content'],
                                  maxLines: 7,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Spacer(),

                            ],
                          ),
                        ),
                      ),
                    ),

                  TextButton(
                    onPressed: () {

                      print(widget.value);
                    },
                    child: const Text(
                      'View Routine',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
