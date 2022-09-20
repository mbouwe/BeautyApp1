
import 'dart:convert';

import 'package:beautyapp/api/api.dart';
import 'package:beautyapp/screen/edit%20profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constant.dart';
import '../ContactScreen/ContactScreen.dart';
import '../Wishlist/wishlist.dart';
import '../login/LoginScreen.dart';

class MultiDrawer extends StatefulWidget {
  const MultiDrawer({Key? key}) : super(key: key);

  @override
  State<MultiDrawer> createState() => _MultiDrawerState();
}

class _MultiDrawerState extends State<MultiDrawer> {
  var userData;

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
    Size size = MediaQuery.of(context).size;
    return MultiLevelDrawer(
      subMenuBackgroundColor: KBackgroundColor,
      backgroundColor: KBackgroundColor,
      rippleColor: Colors.green,
      divisionColor: Colors.blueGrey,
      header: SizedBox(
        height: size.height * 0.20,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.person),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    'firstname',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'surname',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      children: [
        MLMenuItem(
          content: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: const Icon(Icons.arrow_right,color: Colors.pink,),
          leading: const Icon(Icons.person,color: Colors.pink,),
          onClick: () {},
          subMenuItems: [
            MLSubmenu(
              submenuContent: const Text(
                'Whishlist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Wishlist();
                }));
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return const ContactScreen();
                }));
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return const edit_Profile();
                }));
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Skin Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Order History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Habit Tracker',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Challenges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        MLMenuItem(
          content: const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: const Icon(Icons.arrow_right,color: Colors.pink,),
          leading: const Icon(Icons.home,color: Colors.pink,),
          onClick: () {},
          subMenuItems: [
            MLSubmenu(
              submenuContent: const Text(
                'Join Challenges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Log Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Latest\n Communication',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Watch Video',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        MLMenuItem(
          content: const Text(
            'Routine Builder',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: const Icon(Icons.arrow_right,color: Colors.pink,),
          leading: const Icon(Icons.star,color: Colors.pink,),
          onClick: () {},
          subMenuItems: [
            MLSubmenu(
              submenuContent: const Text(
                'Get\n Recommendations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Scan Products',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Routine',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Daily Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        MLMenuItem(
          content: const Text(
            'Shop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: const Icon(Icons.arrow_right,color: Colors.pink,),
          leading: const Icon(Icons.shop,color: Colors.pink,),
          onClick: () {},
          subMenuItems: [
            MLSubmenu(
              submenuContent: const Text(
                'O Search',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'O View Basket',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Reviews',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        MLMenuItem(
          content: const Text(
            'Skin For',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: const Icon(Icons.arrow_right,color: Colors.pink,),
          leading: const Icon(Icons.home,color: Colors.pink,),
          onClick: () {},
          subMenuItems: [
            MLSubmenu(
              submenuContent: const Text(
                'Featured',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Blog Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
            MLSubmenu(
              submenuContent: const Text(
                'Blogs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        MLMenuItem(
          content: const Text(
            'Log Out',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          leading: const Icon(Icons.logout,color: Colors.pink,),
          onClick: () {
            _logout();

          },

        ),

      ],

    );
  }
  void _logout()async{
    var res = await CallApi().getData('logout');
    var body = jsonDecode(res.body);
    if(body['success']){
      SharedPreferences localsStorage = await SharedPreferences.getInstance();
      localsStorage.remove('user');
      localsStorage.remove('token');
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
        return const LoginScreen();
      }));
    }
  }
}
