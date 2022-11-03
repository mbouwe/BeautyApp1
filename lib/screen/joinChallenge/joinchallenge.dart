import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beautyapp/screen/challenges/LogChallengeProgress.dart';
import 'package:beautyapp/screen/challenges/challenge_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../../api/api.dart';
import '../../utils/constant.dart';
import '../center_widget/center_widget.dart';
import '../challenges/ChallengesProgress.dart';
import '../home/home.dart';

class joinChallenge extends StatefulWidget {
  const joinChallenge({Key? key}) : super(key: key);

  @override
  State<joinChallenge> createState() => _joinChallengeState();
}

class _joinChallengeState extends State<joinChallenge> with TickerProviderStateMixin {

  var UserData,long,data,taille,value;
  late int? long1=0;
  void initState() {
    _getData();

    super.initState();


  }



  void _getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userjson = localStorage.getString('contact');
    var contact = json.decode(userjson!);
    setState(() {
      UserData = contact;
    });
    long = UserData[0]['id'];
    _getchallenges();
  }

  void _getchallenges() async{
    var res = await CallApi().getData('get_challenges_user/${UserData[0]['id']}');
    var body = json.decode(res.body);
    if(body['success']==true){
      setState(() {
        data = body;
        taille = data['challenges'];
        var i=0;
        for(var ted in taille){
          i++;
        }
        long1 = i;

      });
    }

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
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body:  Stack(
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
            child: ListView(
             children: [
               Container(
                 child: Row(

                   children: [
                     IconButton(
                       icon: const Icon(Icons.arrow_back_ios),
                       onPressed: () {
                         Navigator.of(context).push(
                             MaterialPageRoute(builder: (BuildContext context) {
                               return const HomePage();
                             }));
                       },
                       color: Colors.pink,
                     ),

                     const Text(
                       'back',
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 20,
                           color: KPrimaryColor),
                     ),


                   ],),
               ),
               const SizedBox(height: 20,),



               const Padding(
                 padding: EdgeInsets.only(left: 28.0,),
                 child: Text(
                   'My Challenge',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                       color: KPrimaryColor),
                 ),
               ),

               for(var i=0;i < long1!;i++)
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     height: 210,
                     decoration: BoxDecoration(
                       color: Colors.transparent,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Stack(
                       children: [
                         Positioned(
                             top: 50,
                             right: 20,
                             left: 20,
                             child: Material(
                               elevation: 0.0,
                               child: Container(
                                 height: 150,
                                 width: 400,
                                 child: Padding(
                                   padding: const EdgeInsets.only(
                                       left: 18.0, top: 30),
                                   child: Text(
                                     data['challenges'][i]['instructions']
                                         .toString(),
                                     maxLines: 7,
                                     textAlign: TextAlign.justify,
                                     overflow: TextOverflow.ellipsis,
                                     style: const TextStyle(
                                         fontSize: 14,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white),
                                   ),
                                 ),
                                 decoration: BoxDecoration(
                                   color: KSecondaryColor,
                                 ),
                               ),
                             )),
                         Positioned(
                             top: 5,
                             right: 20,
                             left: 20,
                             child: Container(
                               height: 60,
                               width: 400,
                               child: Center(
                                   child: Text(
                                     data['challenges'][i]['title'].toString(),
                                     style: const TextStyle(
                                         fontSize: 28,
                                         fontWeight: FontWeight.bold,
                                         color: KPrimaryColor),
                                   )),
                               decoration: BoxDecoration(
                                 color: Colors.white70,
                                 borderRadius: BorderRadius.circular(30),
                               ),
                             )),
                         Positioned(
                             top: 180,
                             right: 200,
                             left: 30,
                             child: Material(
                               elevation: 0.0,
                               child: Container(
                                 height: 30,
                                 child: ElevatedButton(
                                   onPressed: () {
                                    value =data['challenges'][i]['challenge_id'];
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (BuildContext context) {
                                          return  LogChallenge(value:value);
                                        }));

                                   },
                                   child: const Text('View Progress'),
                                   style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.pink,
                                       textStyle:  const TextStyle(
                                           color: Colors.pink,
                                           fontWeight: FontWeight.bold)),
                                 ),
                                 color: Colors.transparent,
                               ),
                             )),
                         Positioned(
                             top: 180,
                             right: 30,
                             left: 200,
                             child: Material(
                               elevation: 0.0,
                               child: Container(
                                 height: 30,
                                 child: ElevatedButton(
                                   onPressed: () {
                                     value =data['challenges'][i]['challenge_id'];
                                     print(value);
                                     Navigator.of(context).push(
                                         MaterialPageRoute(builder: (BuildContext context) {
                                           return  ChallengeProgress(value: value,);
                                         }));
                                   },
                                   child: const Text('Log Progress'),
                                   style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.pink,
                                       textStyle:  const TextStyle(
                                           color: Colors.pink,
                                           fontWeight: FontWeight.bold)),
                                 ),
                                 color: Colors.transparent,
                               ),
                             )),

                       ],
                     ),
                   ),
                 )
             ],
            ),
          ),
        ],
      ),
    );
  }
}
