import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:beautyapp/screen/Routine/Routine_content.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../utils/constant.dart';
import '../home/home.dart';

class Goals_content extends StatefulWidget {
  const Goals_content({Key? key}) : super(key: key);

  @override
  State<Goals_content> createState() => _Goals_contentState();
}

class _Goals_contentState extends State<Goals_content>
    with TickerProviderStateMixin {
  var UserData, long, data, taille,id;
  late int? long1 =0;
  late String value;
  TextEditingController commentcontroller = TextEditingController();

  void initState() {
    _getgoals();

    super.initState();
  }

  void _getgoals() async {
    var res = await CallApi().getData('get_goals');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      setState(() {
        data = body;
        taille = data['goals'];
        var i = 0;
        for (var ted in taille) {
          i++;
        }
        long1 = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: const ParticleOptions(
          spawnMaxRadius: 50,
          spawnMinSpeed: 10.00,
          particleCount: 68,
          spawnMaxSpeed: 50,
          minOpacity: 0.1,
          baseColor: Colors.white38,
        ),
      ),
      vsync: this,
      child: ListView(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
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
                        fontSize: 18,
                        color: KPrimaryColor),
                  )
                ]),
              ),
            ),
            Container(
              child: Row(children: const [
                Text(
                  'Goals',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: KPrimaryColor),
                )
              ]),
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
                  borderRadius: BorderRadius.circular(30),
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
                          padding: const EdgeInsets.only(left: 18.0,top: 20),
                          child: Text(
                            data['goals'][i]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                          ),

                        ),
                        const Divider(color: Colors.white,),
                        const SizedBox(height: 10,),
                        Text(
                          data['goals'][i]['description'],
                          maxLines: 7,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,),

                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 220.0),
                          child: TextButton(
                            onPressed: () {
                               value =data['goals'][i]['id'].toString();
                               Navigator.of(context).push(
                                   MaterialPageRoute(builder: (BuildContext context) {
                                     return  Routine_content(value: value,);
                                   }));
                              print(value);
                            },
                            child: const Text(
                              'View Routines',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ]),
    );
  }
}
