import 'package:beautyapp/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Navigator/Drawer.dart';

class Wishlist_content extends StatefulWidget {
  const Wishlist_content({Key? key}) : super(key: key);

  @override
  State<Wishlist_content> createState() => _Wishlist_contentState();
}

class _Wishlist_contentState extends State<Wishlist_content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: KPrimaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            
            padding: EdgeInsets.all(3),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 38,
                )),
          )
        ],
      ),
      drawer: const MultiDrawer(),
      body: const wishlist(),
    );
  }
}

class wishlist extends StatefulWidget {
  const wishlist({Key? key}) : super(key: key);

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> with TickerProviderStateMixin {
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
          baseColor: Colors.pinkAccent,
        ),
      ),
      vsync: this,
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Skin Juice - Glow Guardian Mist', 'R 160.00 ZAR', 'Images/one.jpeg',
                      false, true, context),
                  _buildCard('Oat-So-Clean Cleansing Balm', 'R 205.00 ZAR', 'Images/two.jpeg',
                      false, true, context),
                  _buildCard('Acne-Prone Skin Starter Kit', 'R 1,135.00 ZAR',
                      'Images/four.jpeg', false, true, context),
                  _buildCard('Gl-oat-worthy Duo ', 'R 390.00 ZAR', 'Images/three.jpeg',
                      false, true, context),
                  _buildCard('Lash & Brow Growth Serum with Brush', 'R 250.00 ZAR', 'Images/five.jpeg',
                      false, true, context),

                ],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5.0, left: 10, right: 10),
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
                              ? Icon(Icons.favorite, color: Colors.pinkAccent)
                              : Icon(Icons.favorite_border,
                              color: Color(0xFFEF7532))
                        ])),
                Hero(
                    tag: imgPath,
                    child: Container(
                        height: 100.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.cover),),),),
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
                    padding: const EdgeInsets.all(8.0),
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

