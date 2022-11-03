import 'dart:convert';

import 'package:beautyapp/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../Navigator/Drawer.dart';
import 'package:animated_background/animated_background.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {


  @override
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
          actions: [
            IconButton(onPressed: (){

            }, icon: const Icon(Icons.shopping_basket))
          ],
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
  var UserData ,data,taille;
  Widget inputField2(
      String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      child: SizedBox(
        height: 80,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),

          ),
        ),
      ),
    );
  }


  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userjson = localStorage.getString('contact')!;
    var contact = json.decode(userjson);
    setState(() {
      UserData = contact;
    });
    _getuser();
  }
  void _getuser() async {
    var res = await CallApi().getData('get_user/${UserData[0]['id']}');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      setState(() {
        data = body;

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
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
        child: Column(
          children: [
            inputField2('Search Product', Icons.search),
            Container(
              padding: EdgeInsets.only(left: 8),
              height: 60,
             child: Row(
               children:  [
                 const Text('Recommended',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.pink),),
                 Spacer(),
                 const Text('view all',style: TextStyle(fontSize: 18,color: Colors.white70),),
                 IconButton(onPressed: (){
                   print(data['contact']['picture']);
                 }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.pink,))
               ],
             ),
              color: Colors.transparent,

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    _buildCard('Skin Juice - Glow Guardian Mist', 'R 160.00 ZAR', 'Images/one.jpeg',
                        false, true, context),
                    _buildCard('Oat-So-Clean Cleansing Balm', 'R 205.00 ZAR', 'Images/two.jpeg',
                        false, true, context),
                    _buildCard('Acne-Prone Skin Starter Kit', 'R 1,135.00 ZAR',
                        'Images/four.jpeg', false, true, context),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              height: 60,
              child: Row(
                children:  [
                  const Text('Top Products',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.pink),),
                  Spacer(),
                  const Text('view all',style: TextStyle(fontSize: 18,color: Colors.white70),),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.pink,))
                ],
              ),
              color: Colors.transparent,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    _buildCard('Acne-Prone Skin Starter Kit', 'R 1,135.00 ZAR',
                        'Images/four.jpeg', false, true, context),
                    _buildCard('Gl-oat-worthy Duo ', 'R 390.00 ZAR', 'Images/three.jpeg',
                        false, true, context),
                    _buildCard('Lash & Brow Growth Serum with Brush', 'R 250.00 ZAR', 'Images/five.jpeg',
                        false, true, context),
                  ],
                ),
              ),
            ),


          ],

        )
      ),
    );
  }
}
Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5.0, left: 5, right: 5),
    child: InkWell(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? const Icon(Icons.favorite, color: Colors.pinkAccent)
                        : const Icon(Icons.favorite_border,
                        color: Color(0xFFEF7532))
                  ])),
          Hero(
            tag: imgPath,
            child: Container(
              height: 90.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.fill),),),),
          const SizedBox(height: 7.0),
          Text(price,
              style: const TextStyle(
                  color: Colors.pinkAccent,
                  fontFamily: 'Varela',
                  fontSize: 14.0)),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Text(name,
              style: const TextStyle(
                  color: KPrimaryColor,
                  fontFamily: 'Varela',
                  fontSize: 14.0),textAlign: TextAlign.center,),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
          Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      const Icon(Icons.shopping_basket,
                          color: Colors.pinkAccent, size: 12.0),
                      const Text('Add to cart',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              color: Colors.pinkAccent,
                              fontSize: 12.0))
                    ],
                    if (added) ...[
                      const Icon(Icons.remove_circle_outline,
                          color: Colors.pinkAccent, size: 12.0),
                      const Text('3',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              color: Color(0xFFD17E50),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      const Icon(Icons.add_circle_outline,
                          color: Color(0xFFD17E50), size: 12.0),
                    ]
                  ]))
        ],),),),);
}