import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beautyapp/screen/Skine/addskine.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../../model/skinemodel.dart';
import '../../utils/constant.dart';
import '../home/home.dart';

class SkineContent extends StatefulWidget {
  const SkineContent({Key? key}) : super(key: key);

  @override
  State<SkineContent> createState() => _SkineContentState();
}

class _SkineContentState extends State<SkineContent> with TickerProviderStateMixin {
  var UserData,long,data,taille;
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
    _getskin();
  }

void _getskin() async{
    var res = await CallApi().getData('get_skin_profile/${long}');
    var body = json.decode(res.body);
    if(body['success']==true){
     setState(() {
       data = body;
       taille = data['contact']['skin_profile'];
       var i=0;
       for(var ted in taille){
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
          particleCount: 28,
          spawnMaxSpeed: 50,
          minOpacity: 0.1,
          baseColor: Colors.white38,
        ),
      ),
      vsync: this,
      child: ListView(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
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
                  'Skine Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: KPrimaryColor),
                )
              ]),
            ),
            const SizedBox(height: 20,),

            for(var i=0;i<long1!;i++)
              Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),

              ),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all( 15.0),
                        child: Text(data['contact']['skin_profile'][i]['content'] ,style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      IconButton(
                          onPressed: () async {
                            var res = await CallApi().getData('delete_skin/${UserData[i]['id']}');
                            var body = json.decode(res.body);
                            if(body['success']==true){
                              var snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'yeah!',
                                  message:
                                  'medication delete successfuil !',
                                  contentType: ContentType.success,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              Navigator.pop(context);
                            }


                          }, icon: Icon(Icons.delete,color: Colors.pink,))
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 200),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const AddSkine();
                      }));

                },
                label: const Text('Add Skine Profile'),
                icon: const Icon(Icons.add),
                backgroundColor: Colors.pink,

              ),
            ),
          ]
      ),
    );
  }
}


