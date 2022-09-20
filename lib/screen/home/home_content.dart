import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Navigator/Drawer.dart';
import 'package:animated_background/animated_background.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async{
    SharedPreferences localsStorage = await SharedPreferences.getInstance();
    var userJson = localsStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData= user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Standard.BEAUTY',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: const MultiDrawer(),
        body: const Mybody(),
      ),
    );
  }
}

class Mybody extends StatefulWidget {
  const Mybody({Key? key}) : super(key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            spawnMaxRadius: 50,
            spawnMinSpeed: 10.00,
            particleCount: 68,
            spawnMaxSpeed: 50,
            minOpacity: 0.1,
            baseColor: Colors.pinkAccent,
          ),
        ),
        vsync: this,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Center(
                child: Text(
                  "Bienvenue sur Standard Beauty \nSur cette Application vous pourrez faire tous les achats de vos produits de beauté",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width: 160.0,
                      height: 200.0,
                      child: Card(
                        color: Colors.grey[250],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: const <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Text(
                                  " Voir Produits",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Voir la liste de tous nos produits de beauté et passer les commandes ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 200.0,
                      child: Card(
                        color: Colors.grey[250],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: const <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Text(
                                  " Rejoindre le Blog ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Discuter avec d'autres de nos clients et obtenez d'autres avis et témoignages  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 200.0,
                      child: Card(
                        color: Colors.grey[250],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: const <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Text(
                                  " Votre Historique ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "regarder l'historique de vos commandes et repasser la même commande en un click ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 200.0,
                      child: Card(
                        color: Colors.grey[250],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: const <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Text(
                                  " Nous contacter ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "vous pouvez directement discuter avec nous ou avec un professionel pour plus d'informations ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
