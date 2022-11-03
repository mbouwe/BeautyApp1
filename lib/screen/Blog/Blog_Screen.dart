import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../api/api.dart';
import '../../utils/constant.dart';
import '../center_widget/center_widget.dart';
import '../home/home.dart';

class Blog_Screen extends StatefulWidget {
  const Blog_Screen({Key? key}) : super(key: key);

  @override
  State<Blog_Screen> createState() => _Blog_ScreenState();
}

class _Blog_ScreenState extends State<Blog_Screen>
    with TickerProviderStateMixin {
  var UserData, long, data, taille, id;
  late int? long1 = 0;

  void initState() {
    _getgoals();

    super.initState();
  }

  void _getgoals() async {
    var res = await CallApi().getData('get_blog');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      setState(() {
        data = body;
        taille = data['news'];
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
                  Row(children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return HomePage();
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Row(children: const [
                      Text(
                        'Blogs ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: KPrimaryColor),
                      )
                    ]),
                  ),
                  for (var i = 0; i < long1!; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 35,
                              child: Material(
                                  elevation: 0.0,
                                  child: Container(
                                    height: 180,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            offset: const Offset(-10, 0),
                                            blurRadius: 20.0,
                                            spreadRadius: 4,
                                          )
                                        ]),
                                  ))),
                          Positioned(
                            top: 0,
                            left: 10,
                            child: Card(
                              elevation: 10.0,
                              shadowColor: Colors.grey.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://img.freepik.com/photos-gratuite/prise-vue-au-grand-angle-seul-arbre-poussant-sous-ciel-assombri-pendant-coucher-soleil-entoure-herbe_181624-22807.jpg?w=2000'))),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 45,
                              left: 180,
                              child: Container(
                            height: 200,
                            width: 200,
                                child: Column(
                                  children:   [
                                    Text(data['news'][i]['name'],style: TextStyle(color: KPrimaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
                                    Text(data['news'][i]['link']),
                                    const Divider(color: Colors.black,),
                                    Text(data['news'][i]['description'] ?? 'No Description',maxLines: 5, ),
                                  ],
                                ),
                          )),
                          Positioned(
                            top: 180,
                              left: 280,
                              child: TextButton(onPressed: (){
                                print(data['news'][0]['link']);
                              }, child: const Text('View more...',style: TextStyle(color: Colors.pink),)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
