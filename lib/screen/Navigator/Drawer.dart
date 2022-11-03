// ignore_for_file: non_constant_identifier_names

import 'dart:convert';


import 'package:beautyapp/screen/Blog/Blog_Screen.dart';
import 'package:beautyapp/screen/Logprogress/Logprogress.dart';
import 'package:beautyapp/screen/Skine/SkineScreen.dart';
import 'package:beautyapp/screen/challenges/challenge_screen.dart';
import 'package:beautyapp/screen/edit%20profile/edit_profile.dart';
import 'package:beautyapp/screen/goals/goals_Screen.dart';
import 'package:beautyapp/screen/joinChallenge/joinchallenge.dart';
import 'package:beautyapp/screen/whachvideo/VideoScreen.dart';
import 'package:circular_image/circular_image.dart';
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
  var UserData ,data,taille;
  String? name,surname,image;
  int? long1=0;

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
    return UserData;
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
        height: size.height * 0.25,

        child: Center(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                Center(child: CircularImage(source: 'http://standard-beauty.afrixcel.co.za/storage/app/customer/images/${UserData?[0]!['picture']}'??'',radius:40,borderWidth:3,borderColor:Colors.pink)),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(UserData?[0]!['firstname']! ?? '',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: KPrimaryColor),),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  UserData?[0]!['surname']!?? '',
                  style: const TextStyle(
                    color: KPrimaryColor,
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
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.pink,
          ),
          leading: const Icon(
            Icons.person,
            color: Colors.pink,
          ),
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ContactScreen();
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return edit_profil();
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SkineScreen();
                }));
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
                'My Challenges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const joinChallenge();
                }));
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
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.pink,
          ),
          leading: const Icon(
            Icons.home,
            color: Colors.pink,
          ),
          onClick: () {},
          subMenuItems: [
            MLSubmenu(
              submenuContent: const Text(
                'All Challenges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onClick: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const ChallengeScreen();
                }));
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return LogProgress();
                }));
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return VideoScreen();
                }));
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
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.pink,
          ),
          leading: const Icon(
            Icons.star,
            color: Colors.pink,
          ),
          onClick: () {

          },
          subMenuItems: [
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Goals_Screen();
                }));
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
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.pink,
          ),
          leading: const Icon(
            Icons.shop,
            color: Colors.pink,
          ),
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
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.pink,
          ),
          leading: const Icon(
            Icons.home,
            color: Colors.pink,
          ),
          onClick: () {},
          subMenuItems: [
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Blog_Screen();
                }));
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Blog_Screen();
                }));
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
          leading: const Icon(
            Icons.logout,
            color: Colors.pink,
          ),
          onClick: () {
            print(UserData[0]['firstname']);
          },
        ),
      ],
    );
  }

  void logout() async {

      SharedPreferences localstorage = await SharedPreferences.getInstance();
      localstorage.remove('token');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const LoginScreen();
          },
        ),
      );

  }
}
