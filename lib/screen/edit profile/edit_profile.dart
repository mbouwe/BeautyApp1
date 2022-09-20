import 'package:beautyapp/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Navigator/Drawer.dart';

class edit_Profile extends StatefulWidget {
  const edit_Profile({Key? key}) : super(key: key);

  @override
  State<edit_Profile> createState() => _edit_ProfileState();
}

class _edit_ProfileState extends State<edit_Profile>
    with TickerProviderStateMixin {
  bool isChecked = false;
  bool isChecked1 = false;
  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: KPrimaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 25,
                )),
          )
        ],
      ),
      drawer: const MultiDrawer(),
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
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg'),
                          ),
                          border:
                              Border.all(color: Colors.pinkAccent, width: 6.0)),
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  child: const Text(
                    'Mbouwe Marcelin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: KPrimaryColor,
                    ),
                  ),
                ),
                const Text(
                  'Phoenix Innov',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Icon(Icons.work),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Founder and CEO at',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'SignBox',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(Icons.work),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Works at',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'SignBox',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(Icons.school),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Phone Number: ',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '+237693270877',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(Icons.home),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Lives in',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Cameroon',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'From',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Douala',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const <Widget>[],
                      ),
                      Container(
                        height: 10.0,
                        child: const Divider(
                          color: KPrimaryColor,
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Medication',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('client is on medications'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Yes'),
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                      if (isChecked == true) {
                                        isChecked1 = false;
                                      }
                                      if (isChecked == false) {
                                        isChecked1 = true;
                                      }
                                    });
                                  },
                                  activeColor: Colors.pinkAccent,
                                  checkColor: Colors.white,
                                ),
                                Text('No'),
                                Checkbox(
                                  value: isChecked1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked1 = value!;
                                      if (isChecked1 == true) {
                                        isChecked = false;
                                      }
                                      if (isChecked1 == false) {
                                        isChecked = true;
                                      }
                                    });
                                  },
                                  activeColor: Colors.pinkAccent,
                                  checkColor: Colors.white,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const <Widget>[
                                Chip(
                                  backgroundColor: Colors.pink,
                                  label: Text(
                                    'Doliprane',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Chip(
                                  backgroundColor: Colors.pink,
                                  label: Text(
                                    'Efferalgan',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Chip(
                                  backgroundColor: Colors.pink,
                                  label: Text(
                                    'Imodium',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle


                                ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add),
                                    color: Colors.white,

                                  ),

                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _showMoreOption(cx) {
    showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.feedback,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Give feedback or report this profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.block,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Block',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Copy link to profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Search Profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
