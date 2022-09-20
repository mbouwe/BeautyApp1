
import 'dart:convert';

import 'package:beautyapp/api/api.dart';
import 'package:beautyapp/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:animated_background/animated_background.dart';
import 'package:provider/provider.dart';
import '../../utils/constant.dart';
import '../Register/RegisterScreen.dart';
import '../home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../restore/forgotpassword.dart';


enum Screen {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> with TickerProviderStateMixin {


  bool _isloading = false;

  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late ScaffoldState scaffoldState;

  _showMsg(msg){
    final snackBar =SnackBar(content: Text(msg),action: SnackBarAction(
      label: 'Close',
      onPressed: (){},
    ),);
  }

  Widget inputField(String hint, IconData iconData,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
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

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: _isloading?null: _login,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: const StadiumBorder(),
            primary: KSecondaryColor,
            elevation: 8,
            shadowColor: Colors.black87),
        child: Text(

          _isloading?'Login...' : title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: KPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: KPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget Logo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon:Icon(Ionicons.logo_facebook),
          ),
          const SizedBox(
            width: 24,
          ),
          IconButton(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
              provider.googleLogin();
            },
            icon:Icon(Ionicons.logo_google),
          ),
        ],
      ),
    );
  }

  Widget Forgotpassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            ''
                'Forgot you password?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return const ForgotPass();
              }));
            },
            child: const Text(
              ' Click Here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Forgotpassword2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            ''
                'You not have a account?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return const RegisterScreen();
              }));
            },
            child: const Text(
              ' Register',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
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
          baseColor: Colors.pinkAccent,

        ),
      ),
      vsync: this,
      child: Stack(
        children: [
          const Positioned(
            top: 50,
            left: 115,
            child: Text(

              'Standard.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 90,
            left: 135,
            child: Text(

              'BEAUTY',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          const Positioned(
            top: 150,
            left: 24,
            child: Text(
              'Welcome\nBack',
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      inputField('Email', Icons.mail_outline,mailcontroller),
                      inputField('Password', Ionicons.lock_closed_outline,passwordcontroller),
                      Forgotpassword(),
                      loginButton('Log In'),
                      orDivider(),
                      Logo(),
                      Forgotpassword2(),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
   void _login() async{
    setState(() {
      _isloading = true;
    });
    var data = {
      'email' : mailcontroller,
      'password' : passwordcontroller,
    };
    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localsStorage = await SharedPreferences.getInstance();
      localsStorage.setString('token', body['token']);
      localsStorage.setString('user', json.decode(body['user']));
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      }));
    }else{
      _showMsg(body['message']);
    }

    setState(() {
      _isloading= false;
    });

  }
}
